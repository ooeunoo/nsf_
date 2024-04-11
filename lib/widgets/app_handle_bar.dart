import 'package:flutter/material.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';

class AppHandleBar extends StatelessWidget {
  const AppHandleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.size40,
      height: AppDimens.size4,
      decoration: BoxDecoration(
        color: AppColor.gray300,
        borderRadius: BorderRadius.circular(AppDimens.size5),
      ),
    );
  }
}
