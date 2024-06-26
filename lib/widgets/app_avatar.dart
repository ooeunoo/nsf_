import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/services/image_picker_service.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/widgets/app_loader.dart';
import 'package:nsf/widgets/app_svg.dart';

class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final double? size;
  final int? rank;
  final double? rankSize;
  final Color? rankColor;
  final bool upload;

  AppAvatar(
      {super.key,
      this.imageUrl,
      this.size,
      this.rank,
      this.rankSize,
      this.rankColor,
      this.upload = false});

  final imagePickerService = ImagePickerService();

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find<AuthService>();
    return Stack(
      children: [
        GestureDetector(
          onTap: () async {
            if (!upload) return;
            XFile? image = await imagePickerService.getProfileImage();
            if (image == null) return;
            await authService.uploadProfileImage(image);
          },
          child: Container(
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
                ? CachedNetworkImage(
                    imageUrl: imageUrl!,
                    placeholder: (context, url) => const AppLoader(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      backgroundImage: imageProvider,
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors
                          .black, // Change to your desired foreground color
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppSvg(Assets.user01, color: AppColor.gray600),
                  ),
          ),
        ),
        if (rank != null) // 등수가 있는 경우 뱃지를 표시
          Positioned(
            bottom: -AppDimens.size8,
            right: -AppDimens.size2,
            child: Container(
              padding: EdgeInsets.all(rankSize ?? AppDimens.size8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: rankColor ?? AppColor.yellow400, // 배경색
                border: Border.all(
                  color: Colors.white, // 테두리 색상
                  width: AppDimens.size2, // 테두리 두께
                ),
              ),
              child: Text(
                '$rank',
                style: const TextStyle(
                  color: AppColor.white, // 숫자 색상
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
