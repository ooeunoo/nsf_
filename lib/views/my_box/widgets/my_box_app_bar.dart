import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_spacer_h.dart';
import 'package:nsf/widgets/app_svg.dart';
import 'package:nsf/widgets/app_text.dart';

class MyBoxAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const MyBoxAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimens.size30, vertical: AppDimens.size10),
        child: AppText(title ?? '등록된 박스가 없습니다.',
            style: Theme.of(context).textTheme.textXL.copyWith(
                fontWeight: AppFontWeight.bold,
                color: AppColor.gray600,
                height: AppDimens.size2)),
      ),
      leadingWidth: AppDimens.size200,
      actions: [
        AppSvg(Assets.user_plus_01),
        const AppSpacerH(),
        AppSvg(Assets.dots_vertical),
        const AppSpacerH(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
