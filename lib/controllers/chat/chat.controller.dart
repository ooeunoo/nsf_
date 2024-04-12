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

  late FocusNode messageFocusNode;
  late TextEditingController messageController;
  late ScrollController scrollController;

  final Rx<bool> _loading = Rx<bool>(false);
  RxList<MessageModel> subscribers = RxList([]);

  bool get loading => _loading.value;

  @override
  onInit() {
    subscribers.bindStream(_subscribeChatMessages());
    messageFocusNode = FocusNode();
    messageController = TextEditingController();
    scrollController = ScrollController();
    super.onInit();
  }

  @override
  onClose() {
    messageFocusNode.dispose();
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  Stream<List<MessageModel>> _subscribeChatMessages() {
    _loading.value = true;
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
        .map((maps) {
          _loading.value = false; // 데이터 도착 시 loading 값을 false로 변경
          return maps.map((map) {
            map['is_mine'] = userId == map['user_id'];
            return MessageModel.fromJson(map);
          }).toList();
        });
  }

  void onSubmitMessage() async {
    String text = messageController.text;
    if (text.isEmpty) {
      return;
    }

    messageController.clear();
    messageFocusNode.requestFocus();
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
        scrollController.jumpTo(
          0.0,
        );
      });
      // 포커스를 텍스트 필드로 다시 설정
    } on PostgrestException catch (error) {
      // 포스트그레스 에러
    } catch (_) {
      // 알수없음 에러
    }
  }
}
