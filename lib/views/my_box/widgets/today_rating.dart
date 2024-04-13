// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nsf/controllers/wod/wod.controller.dart';
import 'package:nsf/mocks/image.dart';
import 'package:nsf/models/wod/wod_model.dart';
import 'package:nsf/nfs_translation.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/views/my_box/widgets/completion_score.dart';
import 'package:nsf/widgets/app.snak_bar.dart';
import 'package:nsf/widgets/app_avatar.dart';
import 'package:nsf/widgets/app_button.dart';
import 'package:nsf/widgets/app_chip.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_svg.dart';
import 'package:nsf/widgets/app_text.dart';

class TodayRating extends StatelessWidget {
  const TodayRating({super.key});

  @override
  Widget build(BuildContext context) {
    final WodController controller = Get.find();

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
        children: [header(context, controller), _body(context, controller)],
      ),
    );
  }

  Widget header(BuildContext context, WodController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(Message.today_rating,
            style: Theme.of(context)
                .textTheme
                .textXL
                .copyWith(fontWeight: AppFontWeight.bold)),
        Obx(() => Row(
              children: [
                if (controller.wodState != WodState.noRegistered) ...{
                  AppChip(
                    text: controller.myWod!.getPurposeInformation,
                    color: AppColor.gray50,
                    borderColor: AppColor.gray200,
                    textStyle: Theme.of(context).textTheme.textSM.copyWith(
                        color: AppColor.gray700,
                        fontWeight: AppFontWeight.medium),
                  )
                },
                AppSvg(Assets.chevron_right)
              ],
            ))
      ],
    );
  }

  Widget _body(BuildContext context, WodController controller) {
    return SizedBox(
      height: AppDimens.size180v,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimens.size20v),
        child: SizedBox(
          height: AppDimens.size100v,
          child: Center(
            child: Obx(() {
              switch (controller.wodState) {
                case WodState.noRegistered:
                  return _notRegisterWodModal(context, controller);
                case WodState.noCompleted:
                  return _notCompletedWod(context, controller);
                case WodState.completed:
                  return _completedWod(context, controller);
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget _notRegisterWodModal(BuildContext context, WodController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          Message.please_set_the_exercise_you_want_to_do,
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
            onPressed: controller.onOpenRegisterWodModal)
      ],
    );
  }

  Widget _notCompletedWod(BuildContext context, WodController controller) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(Message.please_add_exerciese_log,
            style: Theme.of(context).textTheme.textMD.copyWith(
                fontWeight: AppFontWeight.medium, color: AppColor.gray600)),
        AppSpacerV(value: AppDimens.size5v),
        AppButton('기록 추가',
            titleStyle: Theme.of(context).textTheme.textSM.copyWith(
                  color: AppColor.gray700,
                  fontWeight: AppFontWeight.semibold,
                ),
            color: AppColor.white,
            borderColor: AppColor.gray300,
            onPressed: controller.onOpenUpdateWodModal)
      ],
    );
  }

  Widget _completedWod(BuildContext context, WodController controller) {
    bool hasFirst = controller.curTop3Wods!.isNotEmpty;
    bool hasSecond = controller.curTop3Wods!.length >= 2;
    bool hasThrid = controller.curTop3Wods!.length >= 3;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: _rankPoster(
                    context, hasSecond ? controller.curTop3Wods![1] : null, 2)),
            Expanded(
                child: _rankPoster(
                    context, hasFirst ? controller.curTop3Wods![0] : null, 1)),
            Expanded(
                child: _rankPoster(
                    context, hasThrid ? controller.curTop3Wods![2] : null, 3)),
          ],
        ),
      ],
    );
  }

  Widget _rankPoster(BuildContext context, WodModel? wod, int rank) {
    final _avatarImage = wod == null ? null : mockAvatarUrl;
    final _avatarSize = rank == 1 ? AppDimens.size64 : AppDimens.size56;
    final _rank = wod == null ? null : rank;
    final _rankColor = rank == 1
        ? AppColor.yellow400
        : rank == 2
            ? AppColor.gray400
            : AppColor.orange500;
    const _nickname = '알수없음';
    // final _nickname = wod == null ? '-' : wod.user.nickname ?? wod.user.name;
    final _isCompleted = wod == null ? false : wod.completion;
    final _isSuccess =
        wod == null ? null : wod.timeLimit! >= wod.completionTime!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppAvatar(
            imageUrl: null,
            size: _avatarSize,
            rank: _rank,
            rankColor: _rankColor),
        AppSpacerV(value: AppDimens.size10),
        AppText(_nickname,
            style: Theme.of(context).textTheme.textMD.copyWith(
                color: AppColor.gray900, fontWeight: AppFontWeight.semibold)),
        AppSpacerV(value: AppDimens.size4),
        CompletionScore(
          isCompleted: _isCompleted,
          isSuccess: _isSuccess,
          completionTime: wod?.completionTime,
          completionLbs: wod?.completionLbs,
          textStyle: Theme.of(context).textTheme.textXS.copyWith(
              fontWeight: AppFontWeight.medium, color: AppColor.gray600),
        ),
        AppSpacerV(value: AppDimens.size4),
        // AppText(_nickname,
        //     style: Theme.of(context).textTheme.textMD.copyWith(
        //         color: AppColor.gray900, fontWeight: AppFontWeight.semibold)),
      ],
    );
  }
}
