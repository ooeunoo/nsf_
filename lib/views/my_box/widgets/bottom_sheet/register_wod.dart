import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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
import 'package:nsf/widgets/app_chip.dart';
import 'package:nsf/widgets/app_handle_bar.dart';
import 'package:nsf/widgets/app_radio_tile.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_text.dart';
import 'package:nsf/widgets/app_text_input.dart';
import 'package:nsf/widgets/form/number_form.dart';
import 'package:nsf/widgets/form/selection_form.dart';

class RegisterWod extends StatelessWidget {
  RegisterWod({super.key});

  bool hasTimeLimit = false;

  List<FormShortCutModel> shortcuts = [
    FormShortCutModel(
        name: '10분',
        action: () {
          print('10분');
        }),
    FormShortCutModel(
        name: '20분',
        action: () {
          print('20분');
        }),
    FormShortCutModel(
        name: '30분',
        action: () {
          print('30분');
        }),
  ];

  @override
  Widget build(BuildContext context) {
    final CreateWodController controller = Get.find();

    return AppBottomSheetWrap(
      child: Padding(
        padding:
            EdgeInsets.only(top: AppDimens.size10, bottom: AppDimens.size10),
        child: IndexedStack(
          index: controller.step,
          children: [
            Visibility(
                visible: controller.step == 0,
                child: _selectWodType(controller)),
            Visibility(
                visible: controller.step == 1, child: _selectTimeLimit()),
            Visibility(visible: controller.step == 2, child: _inputTimeLimit()),
          ],
        ),
      ),

      //  const Column(
      //   mainAxisSize: MainAxisSize.max,
      //   children: [

      //   ],
      // ),
    );
  }

  Widget _selectWodType(controller) {
    return FormSelection(
        chipTitle: '운동설정',
        title: '운동 타입을 설정해주세요',
        options: WodType.values.map((type) {
          return SelectOptionModel(
              title: type.toString(),
              subTitle: type.description.toString(),
              value: type.toString(),
              groupValue: controller.data.type);
        }).toList(),
        onChanged: controller.selectType);
  }

  Widget _selectTimeLimit() {
    return FormSelection(
      onChanged: (value) {},
      options: [
        SelectOptionModel(
          title: '없어요',
          value: false,
          groupValue: hasTimeLimit,
        ),
        SelectOptionModel(
            title: '있어요',
            value: true,
            groupValue: hasTimeLimit,
            expandWidget: Column(
              children: [
                const AppTextInput(
                    suffixText: '분 이내', inputType: TextInputType.number),
                AppSpacerV(value: AppDimens.size10),
                Row(
                  children: [
                    ...shortcuts.map((shortcut) {
                      return GestureDetector(
                        onTap: shortcut.action,
                        child: Padding(
                          padding: EdgeInsets.only(right: AppDimens.size4),
                          child: AppChip(text: shortcut.name),
                        ),
                      );
                    })
                  ],
                )
              ],
            )),
      ],
      title: '시간 제한이 있나요?',
      chipTitle: '운동설정',
    );
  }

  Widget _inputTimeLimit() {
    return NumberForm(
      title: '시간 제한을 입력해주세요',
      chipTitle: '운동설정',
      shortcuts: shortcuts,
    );
  }
}
