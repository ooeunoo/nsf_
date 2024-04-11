import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/mocks/image.dart';
import 'package:nsf/nfs_translation.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_avatar.dart';
import 'package:nsf/widgets/app_button.dart';
import 'package:nsf/widgets/app_spacer_h.dart';
import 'package:nsf/widgets/app_text.dart';

class MyRating extends StatelessWidget {
  const MyRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 351,
        // height: 68,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(Message.no_rank,
                        style: Theme.of(context).textTheme.textMD.copyWith(
                            fontWeight: AppFontWeight.bold,
                            color: AppColor.gray900)),
                    AppText(Message.no_log,
                        style: Theme.of(context).textTheme.textSM.copyWith(
                            fontWeight: AppFontWeight.medium,
                            color: AppColor.gray600))
                  ],
                )
              ],
            ),
            AppButton(Message.add_log, disable: true, onPressed: () {})
          ],
        ));
  }
}
