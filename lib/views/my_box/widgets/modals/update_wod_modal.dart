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

class UpdateWodModal extends StatefulWidget {
  const UpdateWodModal({super.key});

  @override
  State<UpdateWodModal> createState() => _UpdateWodModalState();
}

class _UpdateWodModalState extends State<UpdateWodModal> {
  @override
  Widget build(BuildContext context) {
    final CreateWodController controller = Get.find<CreateWodController>();

    final List<FormShortCutModel> shortcuts = [
      FormShortCutModel(
          name: '10분',
          action: () {
            print('10분 클릭됨');
            controller.timeLimitController.text = '10';
          }),
      FormShortCutModel(
          name: '20분',
          action: () {
            print('20분 클릭됨');
            controller.timeLimitController.text = '20';
          }),
      FormShortCutModel(
          name: '30분',
          action: () {
            print('30분 클릭됨');
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
                children: const [
                  // Visibility(
                  //     visible: controller.step == 0,
                  //     child: _selectWodType(controller)),
                  // Visibility(
                  //     visible: controller.step == 1,
                  //     child: _selectTimeLimit(controller, shortcuts)),
                  // Visibility(
                  //     visible: controller.step == 2,
                  //     child: _inputTimeLimit(controller, shortcuts)),
                ],
              ),
            ),
          )),
    );
  }
}
