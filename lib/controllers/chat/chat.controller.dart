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

  final RxMap<String, UserModel> cacheUsers =
      RxMap<String, UserModel>({}).obs();
  final Rx<bool> _loading = Rx<bool>(false).obs();
  RxList<MessageModel> subscribers = RxList<MessageModel>([]).obs();

  bool get loading => _loading.value;
  // Map<String, UserModel> get cacheUsers => _cacheUsers.value;

  @override
  onInit() {
    messageFocusNode = FocusNode();
    messageController = TextEditingController();
    scrollController = ScrollController();

    ever(_authService.user, (user) async {
      if (user != null) {
        subscribers.bindStream(_subscribeChatMessages());
      }
    });

    super.onInit();
  }

  @override
  onClose() {
    subscribers.clear();
    messageFocusNode.dispose();
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void onSubmitMessage() async {
    String text = messageController.text;
    if (text.isEmpty) {
      return;
    }

    messageController.clear();
    messageFocusNode.requestFocus();
    try {
      UserModel? user = _authService.user.value;
      if (user == null) return;
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

  Stream<List<MessageModel>> _subscribeChatMessages() {
    _loading.value = true;
    UserModel? user = _authService.user.value;
    if (user == null || user.boxId == null) {
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
          _loading.value = false;
          return maps.map((map) {
            String targetUserId = map['user_id'];
            map['is_mine'] = userId == map['user_id'];
            if (!cacheUsers.containsKey(targetUserId)) {
              cachingUser(targetUserId);
            }
            return MessageModel.fromJson(map);
          }).toList();
        });
  }

  Future<void> cachingUser(String userId) async {
    UserModel targetUser = await _authService.getUser(userId);
    cacheUsers[userId] = targetUser;
  }
}
