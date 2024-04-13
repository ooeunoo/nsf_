import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nsf/models/wod/update_wod_model.dart';
import 'package:nsf/utils/constants.dart';
import 'package:nsf/utils/extensions/string.dart';
import 'package:nsf/utils/time.dart';
import 'package:nsf/widgets/app.snak_bar.dart';
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
  void onInit() {
    super.onInit();
    minController.addListener(_updateCompletionTime);
    secController.addListener(_updateCompletionTime);
    lbsController.addListener(_updateCompletionLbs);
  }

  @override
  void onClose() {
    super.onClose();
    minController.dispose();
    secController.dispose();
    lbsController.dispose();
  }

  // 완료
  Future<void> onConfirm() async {
    await _updateWod();
  }

  void onInitWodId(int id) {
    _data.value = _data.value.copyWith(id: id.toString());
  }

  void onConfirmTime() {
    _step.value = 1;
  }

  void _updateCompletionLbs() {
    String text = lbsController.text;

    if (text.trim().endsWith('=')) {
      text = text.replaceAll('=', '');

      List<String> nums = text.split('+').map((part) => part.trim()).toList();

      List<int> numbers = nums
          .where((part) => int.tryParse(part) != null)
          .map((part) => int.parse(part))
          .toList();

      int sum = numbers.fold(0, (prev, curr) => prev + curr);
      lbsController.text = sum.toString();
    }

    String renewText = lbsController.text;
    if (renewText.isNum) {
      _data.value =
          _data.value.copyWith(completionLbs: int.tryParse(renewText));
    } else {
      _data.value = _data.value.copyWith(completionLbs: null);
    }
  }

  void onClickOperationShortcut(Operations operation) {
    String txt = lbsController.text;

    switch (operation) {
      case Operations.plus:
        if (txt.isEmpty ||
            txt.trim().endsWith(Operations.plus.sign) ||
            txt.trim().endsWith(Operations.equal.sign)) return;

        lbsController.text += ' + ';

      case Operations.equal:
        if (txt.isEmpty || txt.trim().endsWith(Operations.equal.sign)) return;

        lbsController.text += ' = ';
    }
  }

  // Click LBS
  void onClickLBS() {
    String txt = lbsController.text;
    bool containsPlusSign = txt.contains('+');
    if (containsPlusSign) {
      onClickOperationShortcut(Operations.equal);
    }

    onConfirm();
  }

  //////////////
  /// Private Functional
  //////////////
  Future<void> _updateWod() async {
    _data.value = _data.value.copyWith(completion: true);
    await _client
        .from(Constants.wodTable)
        .update(data.toJson())
        .eq('id', data.id.toString())
        .whenComplete(() {
      _closeBottomSheet();
      notifyUpdatedWod();
    });
  }

  _updateCompletionTime() {
    int? minToSec = minuteToSecond(int.tryParse(minController.text));
    int? sec = int.tryParse(secController.text);
    int value = 0;

    if (minToSec != null) value += minToSec;
    if (sec != null) value += sec;

    _data.value =
        _data.value.copyWith(completionTime: value == 0 ? null : value);
  }

  void _closeBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) {
      Get.back();
    }
  }
}
