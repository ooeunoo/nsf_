import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/controllers/wod/wod.controller.dart';
import 'package:nsf/mocks/image.dart';
import 'package:nsf/nfs_translation.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/views/my_box/widgets/completion_score.dart';
import 'package:nsf/widgets/app.snak_bar.dart';
import 'package:nsf/widgets/app_avatar.dart';
import 'package:nsf/widgets/app_button.dart';
import 'package:nsf/widgets/app_spacer_h.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_svg.dart';
import 'package:nsf/widgets/app_text.dart';

class MyRating extends StatelessWidget {
  const MyRating({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find();
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Obx(() => AppAvatar(
                    imageUrl: authService.user.value?.imageUrl,
                    size: AppDimens.size40)),
                const AppSpacerH(),
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        rank(context, controller),
                        log(context, controller)
                      ],
                    ))
              ],
            ),
            Obx(() => AppButton(Message.add_log,
                    disable: controller.wodState != WodState.noCompleted,
                    onPressed: () {
                  notifyRegisterWod();
                }))
          ],
        ));
  }

  Widget rank(BuildContext context, WodController controller) {
    String rank = Message.no_rank;

    bool isCompleted = controller.wodState == WodState.completed;

    if (isCompleted) {
      rank = '${(controller.myWodRanking! + 1).toString()} 등';
    }

    return AppText(rank,
        style: Theme.of(context)
            .textTheme
            .textMD
            .copyWith(fontWeight: AppFontWeight.bold, color: AppColor.gray900));
  }

  Widget log(BuildContext context, WodController controller) {
    bool isCompleted = controller.wodState == WodState.completed;
    int? timeLimit = isCompleted ? controller.myWod!.timeLimit! : null;
    int? completionTime =
        isCompleted ? controller.myWod!.completionTime! : null;
    int? completionLbs = isCompleted ? controller.myWod!.completionLbs! : null;
    bool? isSuccess = isCompleted && timeLimit != null && completionTime != null
        ? timeLimit >= completionTime
        : null;

    return CompletionScore(
      isCompleted: isCompleted,
      isSuccess: isSuccess,
      completionTime: completionTime,
      completionLbs: completionLbs,
    );
  }
}
