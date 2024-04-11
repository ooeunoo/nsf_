import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/services/auth_service.dart';
import 'package:nsf/widgets/app_button.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final AuthService _authService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [AppButton('로그아웃', onPressed: () => _authService.logout())],
        ),
      ),
    );
  }
}
