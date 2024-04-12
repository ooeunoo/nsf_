import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nsf/models/wod/wod_model.dart';
import 'package:nsf/nfs_translation.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/utils/time.dart';
import 'package:nsf/widgets/app_spacer_h.dart';
import 'package:nsf/widgets/app_svg.dart';
import 'package:nsf/widgets/app_text.dart';

class CompletionScore extends StatelessWidget {
  final bool isCompleted;
  final bool? isSuccess;
  final int? completionTime;
  final int? completionLbs;
  final TextStyle? textStyle;

  const CompletionScore({
    super.key,
    required this.isCompleted,
    required this.isSuccess,
    required this.completionTime,
    required this.completionLbs,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (isCompleted) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSvg(isSuccess! ? Assets.success : Assets.failure,
              size: AppDimens.size16),
          AppSpacerH(value: AppDimens.size4),
          AppText(
              '${secondToMinuteSecond(completionTime!)} • $completionLbs lbs',
              style: textStyle ??
                  Theme.of(context).textTheme.textSM.copyWith(
                      fontWeight: AppFontWeight.medium,
                      color: AppColor.gray600)),
        ],
      );
    } else {
      return AppText(Message.no_log,
          style: textStyle ??
              Theme.of(context).textTheme.textSM.copyWith(
                  fontWeight: AppFontWeight.medium, color: AppColor.gray600));
    }
  }
}
