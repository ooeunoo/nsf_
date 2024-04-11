import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/controllers/wod/wod.controller.dart';
import 'package:nsf/mocks/image.dart';
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
import 'package:nsf/widgets/app_spacer_h.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_svg.dart';
import 'package:nsf/widgets/app_text.dart';

class MyRating extends StatelessWidget {
  MyRating({super.key});

  final WodController _controller = Get.find();

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppAvatar(imageUrl: mockAvatarUrl),
                const AppSpacerH(),
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        rank(context, _controller),
                        log(context, _controller)
                      ],
                    ))
              ],
            ),
            Obx(() => AppButton(Message.add_log,
                    disable: _controller.wodState != WodState.noCompleted,
                    onPressed: () {
                  notifyRegisterWod();
                }))
          ],
        ));
  }

  Widget rank(BuildContext context, WodController controller) {
    String rank = Message.no_rank;

    bool isCompleted = _controller.wodState == WodState.completed;

    if (isCompleted) {
      rank = '${(_controller.myWodRanking! + 1).toString()} 등';
    }

    return AppText(rank,
        style: Theme.of(context)
            .textTheme
            .textMD
            .copyWith(fontWeight: AppFontWeight.bold, color: AppColor.gray900));
  }

  Widget log(BuildContext context, WodController controller) {
    bool isCompleted = _controller.wodState == WodState.completed;
    int? timeLimit = isCompleted ? _controller.myWod!.timeLimit! : null;
    int? completionTime =
        isCompleted ? _controller.myWod!.completionTime! : null;
    int? completionLbs = isCompleted ? _controller.myWod!.completionLbs! : null;
    bool? isSuccess = isCompleted ? timeLimit! >= completionTime! : null;

    return CompletionScore(
        isCompleted: isCompleted,
        isSuccess: isSuccess,
        completionTime: completionTime,
        completionLbs: completionLbs);
  }
}
