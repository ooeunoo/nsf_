import 'package:flutter/material.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.brand500,
        strokeWidth: AppDimens.size1,
      ),
    );
  }
}
