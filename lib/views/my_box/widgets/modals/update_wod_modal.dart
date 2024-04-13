import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nsf/controllers/wod/update_wod.controller.dart';
import 'package:nsf/models/forms/form_short_cut_model.dart';
import 'package:nsf/utils/extensions/string.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/widgets/app_bottom_sheet_wrap.dart';
import 'package:nsf/widgets/form/multi_number_form.dart';
import 'package:nsf/widgets/form/number_form.dart';

class UpdateWodModal extends StatefulWidget {
  final int wodId;

  const UpdateWodModal({super.key, required this.wodId});

  @override
  State<UpdateWodModal> createState() => _UpdateWodModalState();
}

class _UpdateWodModalState extends State<UpdateWodModal> {
  int get wodId => widget.wodId;

  @override
  Widget build(BuildContext context) {
    final UpdateWodController controller = Get.find<UpdateWodController>();
    controller.onInitWodId(wodId);

    final List<FormShortCutModel> minuteShortcuts = [
      FormShortCutModel(
          name: '10분',
          action: () {
            controller.minController.text = '10';
          }),
      FormShortCutModel(
          name: '20분',
          action: () {
            controller.minController.text = '20';
          }),
      FormShortCutModel(
          name: '30분',
          action: () {
            controller.minController.text = '30';
          }),
    ];

    final List<FormShortCutModel> operationShortcuts = [
      FormShortCutModel(
          name: Operations.plus.sign,
          action: () {
            controller.onClickOperationShortcut(Operations.plus);
          }),
      FormShortCutModel(
          name: Operations.equal.sign,
          action: () {
            controller.onClickOperationShortcut(Operations.equal);
          }),
    ];

    return AppBottomSheetWrap(
      child: Padding(
          padding:
              EdgeInsets.only(top: AppDimens.size10, bottom: AppDimens.size10),
          child: Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.size20),
              child: IndexedStack(
                index: controller.step,
                children: [
                  Visibility(
                      visible: controller.step == 0,
                      child: _inputTime(controller, minuteShortcuts)),
                  Visibility(
                      visible: controller.step == 1,
                      child: _inputLBS(controller, operationShortcuts)),
                ],
              ),
            ),
          )),
    );
  }

  Widget _inputTime(
      UpdateWodController controller, List<FormShortCutModel> shortcuts) {
    return MultiNumberForm(
      title: '완료한 시간을 작성해주세요.',
      shortcuts: shortcuts,
      onConfirm: controller.onConfirmTime,
      controller1: controller.minController,
      controller2: controller.secController,
      disableConfirm: controller.data.completionTime == null,
    );
  }

  Widget _inputLBS(
      UpdateWodController controller, List<FormShortCutModel> shortcuts) {
    return NumberForm(
        title: '운동한 모든 무게를 합산해주세요',
        subTitle: '20 lbs (데드리프트) + 80 lbs (바벨쓰러스트) \n또는 합산 값 100 lbs',
        shortcuts: shortcuts,
        controller: controller.lbsController,
        onConfirm: controller.onClickLBS,
        disableConfirm: controller.data.completionLbs == null,
        suffixText: 'lbs');
  }
}
