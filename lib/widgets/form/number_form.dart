import 'package:flutter/material.dart';
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
  final String? title;
  final String? subTitle;
  final String? chipTitle;
  final List<FormShortCutModel>? shortcuts;
  final VoidCallback? onConfirm;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const NumberForm(
      {super.key,
      this.title,
      this.subTitle,
      this.chipTitle,
      this.shortcuts,
      this.onConfirm,
      this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Chip
        chipTitle != null ? AppChip(text: chipTitle!) : Container(height: 0),

        // Title
        if (title != null) ...{
          AppText(title!,
              style: Theme.of(context).textTheme.textXL.copyWith(
                  color: AppColor.gray900, fontWeight: AppFontWeight.bold)),
          const AppSpacerV(),
        },

        // Input Box
        AppTextInput(
          suffixText: '분 이내',
          controller: controller,
          inputType: TextInputType.number,
          onChanged: onChanged,
        ),
        AppSpacerV(value: AppDimens.size10),

        // Short Cut
        if (shortcuts != null) ...{
          Row(
            children: [
              ...shortcuts!.map((shortcut) {
                return GestureDetector(
                  onTap: shortcut.action,
                  child: Padding(
                    padding: EdgeInsets.only(right: AppDimens.size4),
                    child: AppChip(
                      text: shortcut.name,
                      color: AppColor.gray50,
                      borderColor: AppColor.gray200,
                      textStyle: Theme.of(context).textTheme.textSM.copyWith(
                          color: AppColor.gray700,
                          fontWeight: AppFontWeight.medium),
                    ),
                  ),
                );
              })
            ],
          ),
          AppSpacerV(value: AppDimens.size10),
        },
        //
        if (onConfirm != null) ...{
          AppButton(
            '완료',
            onPressed: onConfirm!,
            width: double.maxFinite,
          )
        }
      ],
    );
  }
}
