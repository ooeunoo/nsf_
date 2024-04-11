import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/widgets/app_svg.dart';

class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final double? size;

  const AppAvatar({super.key, this.imageUrl, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? AppDimens.size40,
      height: size ?? AppDimens.size40,
      decoration: BoxDecoration(
        color: AppColor.gray100,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColor.gray300,
          width: 0.75,
        ),
      ),
      child: imageUrl != null
          ? CircleAvatar(
              backgroundImage: NetworkImage(imageUrl!),
              backgroundColor: Colors.transparent,
              foregroundColor: AppColor.black,
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppSvg(Assets.user01, color: AppColor.gray600),
            ),
    );
  }
}
