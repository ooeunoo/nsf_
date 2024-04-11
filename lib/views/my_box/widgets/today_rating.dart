import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/controllers/wod/wod.controller.dart';
import 'package:nsf/nfs_translation.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_button.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_svg.dart';
import 'package:nsf/widgets/app_text.dart';

class TodayRating extends StatelessWidget {
  TodayRating({super.key});

  final WodController _wodController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimens.size20, vertical: AppDimens.size12v),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.size20)),
          border: Border(
            top: BorderSide(color: AppColor.gray200, width: AppDimens.size1),
          ),
        ),
        child: Column(
          children: [header(context), _body(context)],
        ));
  }

  Widget header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(Message.today_rating,
            style: Theme.of(context)
                .textTheme
                .textXL
                .copyWith(fontWeight: AppFontWeight.bold)),
        Row(
          children: [AppSvg(Assets.chevron_right)],
        )
      ],
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimens.size20v),
      child: SizedBox(
        height: AppDimens.size100v,
        child: Center(
          child: Obx(() {
            switch (_wodController.wodState) {
              case WodState.noRegistered:
                return _notRegisterWod(context);
              case WodState.noCompleted:
                return _notCompletedWod(context);
              case WodState.completed:
                return _completedWod(context);
            }
          }),
        ),
      ),
    );
  }

  Widget _notRegisterWod(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          Message.please_add_exerciese_log,
          style: Theme.of(context).textTheme.textMD.copyWith(
              fontWeight: AppFontWeight.medium, color: AppColor.gray600),
        ),
        AppSpacerV(value: AppDimens.size5v),
        AppButton('오늘의 운동 설정',
            titleStyle: Theme.of(context).textTheme.textSM.copyWith(
                  color: AppColor.gray700,
                  fontWeight: AppFontWeight.semibold,
                ),
            color: AppColor.white,
            borderColor: AppColor.gray300,
            onPressed: _wodController.registerWod)
      ],
    );
  }

  Widget _notCompletedWod(BuildContext context) {
    return Column(
      children: [
        AppText(Message.please_add_exerciese_log,
            style: Theme.of(context).textTheme.textMD.copyWith(
                fontWeight: AppFontWeight.medium, color: AppColor.gray600))
      ],
    );
  }

  Widget _completedWod(BuildContext context) {
    return Column(
      children: [
        AppText(Message.please_add_exerciese_log,
            style: Theme.of(context).textTheme.textMD.copyWith(
                fontWeight: AppFontWeight.medium, color: AppColor.gray600))
      ],
    );
  }
}