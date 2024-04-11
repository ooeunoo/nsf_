import 'package:flutter/material.dart';
import 'package:nsf/models/forms/select_option_model.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_chip.dart';
import 'package:nsf/widgets/app_radio_tile.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_text.dart';

class FormSelection extends StatelessWidget {
  final String title;
  final String? subTitle;
  final List<SelectOptionModel> options;
  final String? chipTitle;
  final VoidCallback onSelect;

  const FormSelection(
      {super.key,
      required this.options,
      required this.title,
      this.subTitle,
      required this.onSelect,
      this.chipTitle});

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
          ...options.map((option) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimens.size10),
              child: AppRadioTile(
                onChanged: onSelect,
                title: AppText(
                  option.title
                      .toString()
                      .split('.')
                      .last, // enum 값에서 '.' 이후의 문자열만 가져오기
                  style: Theme.of(context).textTheme.textMD.copyWith(
                        color: AppColor.gray700,
                        fontWeight: AppFontWeight.bold,
                      ),
                ),
                subtitle: AppText(
                  option.subTitle ?? "",
                  style: Theme.of(context).textTheme.textSM.copyWith(
                        color: AppColor.gray600,
                        fontWeight: AppFontWeight.medium,
                      ),
                ),
                value: option.value,
                groupValue: option.groupValue,
              ),
            );
          }),
          const AppSpacerV()
        ],
      ),
    );
  }
}
