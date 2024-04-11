import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/models/forms/form_short_cut_model.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_button.dart';
import 'package:nsf/widgets/app_chip.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_text.dart';
import 'package:nsf/widgets/app_text_input.dart';

class NumberForm extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? chipTitle;
  final List<FormShortCutModel>? shortcuts;

  const NumberForm(
      {super.key,
      required this.title,
      this.subTitle,
      this.chipTitle,
      this.shortcuts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (chipTitle != null) AppChip(text: chipTitle!),
          AppText(title,
              style: Theme.of(context).textTheme.textXL.copyWith(
                  color: AppColor.gray900, fontWeight: AppFontWeight.bold)),
          const AppSpacerV(),
          const AppTextInput(
            suffixText: '분 이내',
            inputType: TextInputType.number,
          ),
          AppSpacerV(value: AppDimens.size10),
          if (shortcuts != null) ...{
            Row(
              children: [
                ...shortcuts!.map((shortcut) {
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
          },
          AppSpacerV(value: AppDimens.size10),
          AppButton(
            '완료',
            onPressed: () {},
            // height: AppDimens.size40,
            width: double.maxFinite,
          )
        ],
      ),
    );
  }
}
