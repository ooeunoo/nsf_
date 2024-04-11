import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/extensions/context.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_spacer_h.dart';
import 'package:nsf/widgets/app_svg.dart';
import 'package:nsf/widgets/app_text.dart';

int SNACKBAR_DURATION = 1;

notifyRegisterWod() {
  Get.rawSnackbar(
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppSvg(Assets.check),
        AppSpacerH(value: AppDimens.size10),
        AppText(
          '오늘의 운동을 등록했어요',
          align: TextAlign.center,
          style: Theme.of(Get.context!).textTheme.textMD.copyWith(
              color: AppColor.gray50, fontWeight: AppFontWeight.regular),
        ),
      ],
    ),
    maxWidth: AppDimens.size230,
    backgroundColor: AppColor.gray700,
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: AppDimens.size16,
    duration: Duration(seconds: SNACKBAR_DURATION),
    animationDuration: Duration(seconds: SNACKBAR_DURATION),
    padding: EdgeInsets.symmetric(
        horizontal: AppDimens.size20, vertical: AppDimens.size12v),
    margin: EdgeInsets.symmetric(
        horizontal: AppDimens.size20,
        vertical:
            MediaQuery.of(Get.context!).padding.bottom + AppDimens.size30),
  );
}

notifyUpdatedWod() {
  Get.rawSnackbar(
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppSvg(Assets.check),
        AppSpacerH(value: AppDimens.size10),
        AppText(
          '기록을 등록했어요',
          align: TextAlign.center,
          style: Theme.of(Get.context!).textTheme.textMD.copyWith(
              color: AppColor.gray50, fontWeight: AppFontWeight.regular),
        ),
      ],
    ),
    maxWidth: AppDimens.size230,
    backgroundColor: AppColor.gray700,
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: AppDimens.size16,
    duration: Duration(seconds: SNACKBAR_DURATION),
    animationDuration: Duration(seconds: SNACKBAR_DURATION),
    padding: EdgeInsets.symmetric(
        horizontal: AppDimens.size20, vertical: AppDimens.size12v),
    margin: EdgeInsets.symmetric(
        horizontal: AppDimens.size20,
        vertical:
            MediaQuery.of(Get.context!).padding.bottom + AppDimens.size30),
  );
}
