import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nsf/models/user/user_model.dart';
import 'package:nsf/models/wod/create_wod_model.dart';
import 'package:nsf/models/wod/wod_model.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/utils/time.dart';
import 'package:nsf/widgets/app.snak_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateWodController extends GetxController {
  final SupabaseClient _client = Supabase.instance.client;
  final AuthService _authService = Get.find();
  final TextEditingController timeLimitController = TextEditingController();

  final Rx<int> _step = 0.obs;
  final Rx<CreateWodModel> _data = Rx<CreateWodModel>(const CreateWodModel(
      userId: null, boxId: null, date: null, type: null, timeLimit: null));

  int get step => _step.value;
  CreateWodModel get data => _data.value;

  @override
  void onInit() {
    super.onInit();
    _initialFormData();
    timeLimitController.addListener(() {
      if (timeLimitController.text.isNum) {
        _data.value = _data.value.copyWith(
            timeLimit: convertMinToSec(timeLimitController.text).toString());
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    timeLimitController.dispose();
  }

  // 타입 선택
  void onSelectType(WodType? type) {
    if (type != null) {
      _data.value = _data.value.copyWith(type: type);

      switch (type) {
        case WodType.ForTime:
          _step.value = 1;
          break;
        case WodType.AMRAP:
          _step.value = 2;
          break;
        case WodType.EMOM:
          _step.value = 2;
          break;
      }
    }
  }

  // 시간 제한 선택
  void onSelectTimeLimit(bool? state) {
    if (state != null) {
      _data.value = _data.value.copyWith(hasTimeLimit: state);
    }
  }

  // 완료
  void onConfirm() {
    _createWod();
    _closeBottomSheet();
  }

  //////////////
  /// Private Functional
  //////////////
  void _createWod() async {
    final response = await _client.from('wods').insert(data.toJson());
  }

  // Form Data 초기화
  void _initialFormData() {
    UserModel? user = _authService.user;
    if (user == null || user.boxId == null) return _closeBottomSheet();

    String userId = user.id;
    int boxId = user.boxId!;

    _data.value = _data.value
        .copyWith(userId: userId, boxId: boxId, date: getTodayDateTime());
  }

  void _closeBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) {
      Get.back();
    }
  }
}
