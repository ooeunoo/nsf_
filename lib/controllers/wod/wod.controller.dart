import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/models/box/box_model.dart';
import 'package:nsf/models/user/user_model.dart';
import 'package:nsf/models/wod/wod_model.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/utils/time.dart';
import 'package:nsf/views/my_box/my_box.dart';
import 'package:nsf/views/my_box/widgets/modals/register_wod_modal.dart';
import 'package:nsf/views/my_box/widgets/modals/update_wod_modal.dart';
import 'package:nsf/views/profile/profile.dart';
import 'package:nsf/widgets/app.snak_bar.dart';
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
    _checkMyWod();
  }

  void registerWod() {
    Get.bottomSheet(const RegisterWodModal(),
            isDismissible: true,
            isScrollControlled: true,
            enableDrag: false,
            useRootNavigator: true)
        .whenComplete(() {
      notifyRegisterWod();
      _checkMyWod();
    });
  }

  void updateWod() {
    Get.bottomSheet(const UpdateWodModal(),
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
  _checkMyWod() async {
    UserModel? user = _authService.user;
    if (user?.boxId != null) {
      String userId = user!.id;
      int boxId = user.boxId!;
      _wod.value = await _getMyWod(userId, boxId);
    } else {
      _wod.value = null;
    }
  }

  // 와드 가져오기
  Future<WodModel> _getMyWod(String userId, int boxId) async {
    final data = await _client
        .from('wods')
        .select('*')
        .eq('user_id', userId)
        .eq('box_id', boxId)
        .eq('date', getTodayDateTime())
        .single();
    return WodModel.fromJson(data);
  }

  // Stream<WodModel?> _subscribeWod()  {
  //   UserModel? user = _authService.user;
  //   if (user?.boxId != null) {
  //     String userId = user!.id;
  //     int boxId = user.boxId!;
  //     _wod.value = _client.from('wods').stream().select('*').eq('user_id', userId)
  //       .eq('box_id', boxId)
  //       .eq('date', getTodayDateTime())
  //   } else {
  //     _wod.value = null;
  //   }
  // }
}
