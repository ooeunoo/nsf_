import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/views/my_box/my_box.dart';
import 'package:nsf/views/profile/profile.dart';

class RootController extends GetxController {
  late PageController pageController;

  var currentPage = 0.obs;

  List<Widget> pages = [
    const MyBoxView(),
    ProfileView(),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }
}
