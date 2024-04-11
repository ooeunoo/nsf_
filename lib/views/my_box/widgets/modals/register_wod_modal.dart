import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nsf/controllers/wod/register_wod.controller.dart';
import 'package:nsf/controllers/wod/wod.controller.dart';
import 'package:nsf/models/forms/form_short_cut_model.dart';
import 'package:nsf/models/forms/select_option_model.dart';
import 'package:nsf/models/wod/wod_model.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_bottom_sheet_wrap.dart';
import 'package:nsf/widgets/app_button.dart';
import 'package:nsf/widgets/app_chip.dart';
import 'package:nsf/widgets/app_handle_bar.dart';
import 'package:nsf/widgets/app_radio_tile.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_text.dart';
import 'package:nsf/widgets/app_text_input.dart';
import 'package:nsf/widgets/form/number_form.dart';
import 'package:nsf/widgets/form/selection_form.dart';

class RegisterWodModal extends StatefulWidget {
  const RegisterWodModal({super.key});

  @override
  State<RegisterWodModal> createState() => _RegisterWodModalState();
}

class _RegisterWodModalState extends State<RegisterWodModal> {
  @override
  Widget build(BuildContext context) {
    final CreateWodController controller = Get.find<CreateWodController>();

    final List<FormShortCutModel> shortcuts = [
      FormShortCutModel(
          name: '10분',
          action: () {
            controller.timeLimitController.text = '10';
          }),
      FormShortCutModel(
          name: '20분',
          action: () {
            controller.timeLimitController.text = '20';
          }),
      FormShortCutModel(
          name: '30분',
          action: () {
            controller.timeLimitController.text = '30';
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
                      child: _selectWodType(controller)),
                  Visibility(
                      visible: controller.step == 1,
                      child: _selectTimeLimit(controller, shortcuts)),
                  Visibility(
                      visible: controller.step == 2,
                      child: _inputTimeLimit(controller, shortcuts)),
                ],
              ),
            ),
          )),
    );
  }

  Widget _selectWodType(CreateWodController controller) {
    return FormSelection<WodType?>(
      chipTitle: '운동설정',
      title: '운동 타입을 설정해주세요',
      onChanged: controller.onSelectType,
      selectedValue: controller.data.type,
      options: WodType.values.map((type) {
        return SelectOptionModel(
          title: type.toString(),
          subTitle: type.description.toString(),
          value: type,
        );
      }).toList(),
    );
  }

  Widget _selectTimeLimit(
      CreateWodController controller, List<FormShortCutModel> shortcuts) {
    return FormSelection<bool?>(
      title: '시간 제한이 있나요?',
      chipTitle: '운동설정',
      onChanged: controller.onSelectTimeLimit,
      onConfirm: controller.onConfirm,
      selectedValue: controller.data.hasTimeLimit,
      options: [
        SelectOptionModel(
          title: '없어요',
          value: false,
        ),
        SelectOptionModel(
            title: '있어요',
            value: true,
            expandWidget: NumberForm(
              shortcuts: shortcuts,
              suffixText: '분 이내',
              controller: controller.timeLimitController,
            )),
      ],
    );
  }

  Widget _inputTimeLimit(
      CreateWodController controller, List<FormShortCutModel> shortcuts) {
    return NumberForm(
      title: '시간 제한을 입력해주세요',
      chipTitle: '운동설정',
      shortcuts: shortcuts,
      suffixText: '분 이내',
      controller: controller.timeLimitController,
      onConfirm: controller.onConfirm,
    );
  }
}
