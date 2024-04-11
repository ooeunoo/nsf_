import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/models/box/box_model.dart';
import 'package:nsf/models/user/user_model.dart';
import 'package:nsf/models/wod/wod_model.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/views/my_box/my_box.dart';
import 'package:nsf/views/my_box/widgets/bottom_sheet/register_wod.dart';
import 'package:nsf/views/profile/profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum WodState {
  noRegistered, // 아직 미등록
  noCompleted, // 등록되었지만 완료하지않은 상태
  completed //  완료 상태
}

class WodController extends GetxController {
  final AuthService _authService = Get.find();

  final _client = Supabase.instance.client;

  final Rxn<WodModel> _wod = Rxn<WodModel>();

  WodModel? get wod => _wod.value;
  WodState get wodState => _refreshWodState();

  @override
  void onInit() {
    super.onInit();
    _checkWod();
  }

  void registerWod() {
    Get.bottomSheet(RegisterWod(),
        isDismissible: true,
        isScrollControlled: true,
        enableDrag: false,
        useRootNavigator: true);
  }

  // 와드 상태를 업데이트
  WodState _refreshWodState() {
    if (wod == null) {
      return WodState.noRegistered;
    }
    bool completed = wod!.completion;

    if (!completed) {
      return WodState.noCompleted;
    } else {
      return WodState.completed;
    }
  }

  // 와드 확인
  _checkWod() async {
    UserModel? user = _authService.user.value;

    if (user?.box_id != null) {
      String userId = user!.id;
      int boxId = user.box_id!;
      _wod.value = await _getWod(userId, boxId);
    } else {
      _wod.value = null;
    }
  }

  // 와드 가져오기
  Future<WodModel> _getWod(String userId, int boxId) async {
    final data = await _client
        .from('wods')
        .select('*')
        .eq('user_id', userId)
        .eq('box_id', boxId)
        .single();
    return WodModel.fromJson(data);
  }
}
