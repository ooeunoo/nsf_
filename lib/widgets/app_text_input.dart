import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';

class AppTextInput extends StatelessWidget {
  final String? initialValue;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final String? prefixText;
  final Widget? prefix;
  final String? suffixText;
  final Widget? suffix;
  final TextInputType? inputType;

  const AppTextInput({
    super.key,
    this.initialValue,
    this.onChanged,
    this.hintText,
    this.prefix,
    this.suffix,
    this.prefixText,
    this.suffixText,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.size10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.size8)),
        border: Border.all(
          color: AppColor.brand300,
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColor.brand500,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
        color: Colors.white,
      ),
      child: TextFormField(
        autofocus: true,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context).textTheme.textMD.copyWith(
              color: AppColor.gray900,
              fontWeight: AppFontWeight.medium,
            ),
        cursorHeight: 16.sp,
        cursorColor: AppColor.gray500,
        controller: TextEditingController(text: initialValue),
        keyboardType: inputType,
        decoration: InputDecoration(
            border: InputBorder.none,
            counterText: '',
            prefixText: prefixText,
            alignLabelWithHint: true,
            isDense: true,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
            suffixText: suffixText,
            suffixStyle: Theme.of(context).textTheme.textMD.copyWith(
                color: AppColor.gray900, fontWeight: AppFontWeight.medium)),
      ),
    );
  }
}
