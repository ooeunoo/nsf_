import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/controllers/root/root.controller.dart';
import 'package:nsf/nfs_translation.dart';
import 'package:nsf/utils/assets.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/widgets/app_svg.dart';

class RootView extends StatelessWidget {
  RootView({super.key});

  final RootController _rootController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: _rootController.currentPage.value,
              onTap: _rootController.goToTab,
              items: [
                tabItem(Assets.home01, Message.my_box, 0),
                tabItem(Assets.user03, Message.profile, 1),
              ],
            )),
        body: PageView(
          controller: _rootController.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [..._rootController.pages],
        ));
  }

  BottomNavigationBarItem tabItem(String iconPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: AppSvg(iconPath,
          color: _rootController.currentPage.value == index
              ? AppColor.gray900
              : AppColor.gray500),
      label: label,
    );
  }
}
