import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';

class AppSvg extends StatelessWidget {
  final String path;
  final Color? color;
  final double? size;

  const AppSvg(this.path, {super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      colorFilter: ColorFilter.mode(color ?? AppColor.gray500, BlendMode.srcIn),
      width: size ?? AppDimens.size24,
      height: size ?? AppDimens.size24,
    );
  }
}
