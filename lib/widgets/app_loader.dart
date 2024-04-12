import 'package:flutter/material.dart';
import 'package:nsf/utils/styles/color.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColor.brand500),
    );
  }
}
