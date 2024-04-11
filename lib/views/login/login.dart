import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/widgets/app_button.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final AuthService _authService = Get.find();

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final int randomNumber = random.nextInt(2) + 1;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/login$randomNumber.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton('카카오 로그인', onPressed: () {
                _authService.loginWithKakao();
              })
            ],
          ),
        ),
      ),
    );
  }
}
