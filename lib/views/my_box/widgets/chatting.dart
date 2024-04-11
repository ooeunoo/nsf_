import 'package:flutter/material.dart';
import 'package:nsf/nfs_translation.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_svg.dart';
import 'package:nsf/widgets/app_text.dart';

class Chatting extends StatelessWidget {
  const Chatting({super.key});

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
          children: [
            Header(context),
          ],
        ));
  }

  Widget Header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(Message.chatting,
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
}
