import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/models/message/create_message_model.dart';
import 'package:nsf/models/message/message_model.dart';
import 'package:nsf/models/user/user_model.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatController extends GetxController {
  final _client = Supabase.instance.client;

  final AuthService _authService = Get.find();

  late TextEditingController textController;
  late ScrollController scrollController;

  RxList<MessageModel> subscribers = RxList([]);

  @override
  onInit() {
    subscribers.bindStream(_subscribeChatMessages());
    textController = TextEditingController();
    scrollController = ScrollController();

    super.onInit();
  }

  @override
  onClose() {
    textController.dispose();
    super.onClose();
  }

  Stream<List<MessageModel>> _subscribeChatMessages() {
    UserModel? user = _authService.user;
    if (user == null) {
      return const Stream.empty();
    }
    String userId = user.id;
    int boxId = user.boxId!;

    return _client
        .from(Constants.messageTable)
        .stream(primaryKey: ['id'])
        .eq('box_id', boxId)
        .order('created_at')
        .map((maps) => maps.map((map) {
              map['is_mine'] = userId == map['user_id'];
              return MessageModel.fromJson(map);
            }).toList());
  }

  void onSubmitMessage() async {
    String text = textController.text;
    if (text.isEmpty) {
      return;
    }

    textController.clear();

    try {
      UserModel user = _authService.user!;
      String userId = user.id;
      int boxId = user.boxId!;
      CreateMessageModel data =
          CreateMessageModel(userId: userId, boxId: boxId, content: text);
      await _client
          .from(Constants.messageTable)
          .insert(data.toJson())
          .then((value) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    } on PostgrestException catch (error) {
      // 포스트그레스 에러
    } catch (_) {
      // 알수없음 에러
    }
  }
}
