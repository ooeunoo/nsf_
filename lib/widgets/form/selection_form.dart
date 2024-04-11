import 'package:flutter/material.dart';
import 'package:nsf/models/forms/select_option_model.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_button.dart';
import 'package:nsf/widgets/app_chip.dart';
import 'package:nsf/widgets/app_radio_tile.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_text.dart';

class FormSelection<T> extends StatelessWidget {
  final String title;
  final String? subTitle;
  final List<SelectOptionModel> options;
  final T? selectedValue;
  final String? chipTitle;
  final void Function(T? value) onChanged;
  final VoidCallback? onConfirm;

  const FormSelection(
      {super.key,
      required this.options,
      required this.title,
      this.subTitle,
      required this.onChanged,
      this.chipTitle,
      this.selectedValue,
      this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (chipTitle != null) AppChip(text: chipTitle!),
        AppText(title,
            style: Theme.of(context).textTheme.textXL.copyWith(
                color: AppColor.gray900, fontWeight: AppFontWeight.bold)),
        const AppSpacerV(),
        ...options.map((option) {
          bool isSelected = option.value == selectedValue;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppDimens.size5),
                child: AppRadioTile<T>(
                  selected: isSelected,
                  onChanged: onChanged,
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
                  subtitle: option.subTitle != null
                      ? AppText(
                          option.subTitle ?? "",
                          style: Theme.of(context).textTheme.textSM.copyWith(
                                color: AppColor.gray600,
                                fontWeight: AppFontWeight.medium,
                              ),
                        )
                      : null,
                  value: option.value,
                  groupValue: selectedValue as T,
                ),
              ),
              if (isSelected && option.expandWidget != null) ...{
                option.expandWidget!
              },
            ],
          );
        }),
        if (onConfirm != null) ...{
          AppButton(
            '완료',
            onPressed: onConfirm!,
            width: double.maxFinite,
            disable: selectedValue == null,
          )
        }
      ],
    );
  }
}
