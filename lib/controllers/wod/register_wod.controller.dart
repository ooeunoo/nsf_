import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsf/models/wod/create_wod_model.dart';
import 'package:nsf/models/wod/wod_model.dart';

class CreateWodController extends GetxController {
  late PageController pageController;

  final Rx<int> _step = 0.obs;
  final Rx<CreateWodModel> _data = Rx<CreateWodModel>(
      const CreateWodModel(date: null, type: null, timeLimit: null));

  int get step => _step.value;
  CreateWodModel get data => _data.value;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  void selectType(dynamic type) {
    print(type);
  }
}
