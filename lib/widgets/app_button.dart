import 'package:flutter/material.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_spacer_h.dart';
import 'package:nsf/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color? color;
  final Color? borderColor;
  final double? width;
  final double? height;
  final bool disable;

  final Widget? leadingIcon;

  final VoidCallback onPressed;

  const AppButton(this.title,
      {super.key,
      required this.onPressed,
      this.titleStyle,
      this.color,
      this.borderColor,
      this.leadingIcon,
      this.width,
      this.height,
      this.disable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.size8),
      ),
      child: TextButton(
        onPressed: () {
          if (!disable) {
            onPressed();
          }
        },
        style: ButtonStyle(
            backgroundColor: color != null
                ? MaterialStateProperty.all(color)
                : disable
                    ? MaterialStateProperty.all(AppColor.gray100)
                    : MaterialStateProperty.all(AppColor.brand600),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.size8),
                side: BorderSide(color: borderSideColorWrap(), width: 1)))),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leadingIcon != null)
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: AppDimens.size2),
                      child: SizedBox(
                        child: leadingIcon,
                      ),
                    ),
                    AppSpacerH(value: AppDimens.size8),
                  ],
                ),
              AppText(title, style: titleStyleWrap(context))
            ],
          ),
        ),
      ),
    );
  }

  Color borderSideColorWrap() {
    Color color = borderColor ?? AppColor.brand600;
    if (disable) {
      color = AppColor.gray200;
    }
    return color;
  }

  TextStyle titleStyleWrap(BuildContext context) {
    TextStyle style = titleStyle ??
        Theme.of(context).textTheme.textSM.copyWith(
            fontWeight: AppFontWeight.semibold, color: AppColor.white);

    if (disable) {
      style = style.copyWith(color: AppColor.gray400);
    }

    return style;
  }
}
