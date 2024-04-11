import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nsf/models/wod/update_wod_model.dart';
import 'package:nsf/utils/time.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum Operations {
  plus('+'),
  equal('='),
  ;

  const Operations(this.sign);

  final String sign;
}

class UpdateWodController extends GetxController {
  final SupabaseClient _client = Supabase.instance.client;
  final TextEditingController minController = TextEditingController();
  final TextEditingController secController = TextEditingController();
  final TextEditingController lbsController = TextEditingController();

  final Rx<int> _step = 0.obs;
  final Rx<UpdateWodModel> _data = Rx<UpdateWodModel>(const UpdateWodModel(
      id: null, completion: false, completionLbs: null, completionTime: null));

  int get step => _step.value;
  UpdateWodModel get data => _data.value;

  @override
  void onClose() {
    super.onClose();
    minController.dispose();
    secController.dispose();
    lbsController.dispose();
  }

  // 완료
  void onConfirm() {
    _updateWod();
    _closeBottomSheet();
  }

  void onInitWodId(int id) {
    _data.value = _data.value.copyWith(id: id.toString());
  }

  void onConfirmTime() {
    int minToSec = minuteToSecond(int.tryParse(minController.text) ?? 0);
    int sec = int.tryParse(secController.text) ?? 0;
    _data.value = _data.value.copyWith(completionTime: minToSec + sec);
    _step.value = 1;
  }

  void onClickOperationShortcut(Operations operation) {
    String txt = lbsController.text;

    switch (operation) {
      case Operations.plus:
        if (txt.isEmpty) return;
        if (txt.endsWith(Operations.plus.sign) ||
            txt.endsWith(Operations.equal.sign)) return;

        lbsController.text += ' + ';

      case Operations.equal:
        List<String> nums = txt.split('+').map((part) => part.trim()).toList();
        List<int> numbers = nums
            .where((part) => int.tryParse(part) != null)
            .map((part) => int.parse(part))
            .toList();

        int sum = numbers.fold(0, (prev, curr) => prev + curr);
        lbsController.text = sum.toString();
    }
  }

  // Click LBS
  void onClickLBS() {
    String txt = lbsController.text;
    bool containsPlusSign = txt.contains('+');
    if (containsPlusSign) {
      onClickOperationShortcut(Operations.equal);
    }

    _data.value =
        _data.value.copyWith(completionLbs: int.parse(lbsController.text));

    onConfirm();
  }
  //////////////
  /// Private Functional
  //////////////

  void _updateWod() async {
    // 업데이트
    _data.value = _data.value.copyWith(completion: true);

    await _client
        .from('wods')
        .update(data.toJson())
        .eq('id', data.id.toString());
  }

  void _closeBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) {
      Get.back();
    }
  }
}
