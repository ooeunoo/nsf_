import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/controllers/box/box.controller.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/views/my_box/widgets/chatting.dart';
import 'package:nsf/views/my_box/widgets/my_rating.dart';
import 'package:nsf/views/my_box/widgets/today_rating.dart';
import 'package:nsf/widgets/app_button.dart';
import 'package:nsf/widgets/app_spacer_h.dart';
import 'package:nsf/widgets/app_spacer_v.dart';
import 'package:nsf/widgets/app_svg.dart';
import 'package:nsf/widgets/app_text.dart';

class MyBoxView extends StatelessWidget {
  const MyBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    final BoxController controller = Get.find();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.size30),
            child: Obx(() => AppText(controller.box.value?.name ?? '',
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: Theme.of(context).textTheme.textXL.copyWith(
                    fontWeight: AppFontWeight.bold,
                    color: AppColor.gray600,
                    height: AppDimens.size2))),
          ),
          titleSpacing: 0,
          centerTitle: false,
          actions: [
            AppSvg(Assets.user_plus_01),
            const AppSpacerH(),
            AppSvg(Assets.dots_vertical),
            const AppSpacerH(),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.size10, vertical: AppDimens.size10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyRating(),
              AppSpacerV(
                value: AppDimens.size10,
              ),
              TodayRating(),
              AppSpacerV(
                value: AppDimens.size10,
              ),
              const Chatting()
            ],
          ),
        ),
      ),
    );
  }
}
