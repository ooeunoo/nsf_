import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';
import 'package:nsf/utils/styles/theme.dart';
import 'package:nsf/widgets/app_button.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final AuthService _authService = Get.find();

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final int randomNumber = random.nextInt(2) + 1;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/login$randomNumber.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              left: 20,
              right: 20,
              bottom: AppDimens.size200v,
              child: AppButton('애플 로그인',
                  height: AppDimens.size50,
                  titleStyle: Theme.of(context).textTheme.textLG.copyWith(
                      color: AppColor.gray900, fontWeight: AppFontWeight.bold),
                  color: AppColor.white,
                  borderColor: AppColor.white, onPressed: () {
                _authService.loginWithApple();
              })),
          Positioned(
              left: 20,
              right: 20,
              bottom: AppDimens.size100v,
              child: AppButton('카카오 로그인',
                  height: AppDimens.size50,
                  titleStyle: Theme.of(context).textTheme.textLG.copyWith(
                      color: AppColor.gray900, fontWeight: AppFontWeight.bold),
                  color: AppColor.yellow400,
                  borderColor: AppColor.yellow400, onPressed: () {
                _authService.loginWithKakao();
              })),
        ],
      ),
    );
  }
}
