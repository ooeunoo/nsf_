import 'package:get/get.dart';
import 'package:nsf/controllers/box/box.controller.dart';
import 'package:nsf/controllers/root/root.controller.dart';
import 'package:nsf/controllers/wod/register_wod.controller.dart';
import 'package:nsf/controllers/wod/wod.controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
    Get.lazyPut<BoxController>(() => BoxController());
    Get.lazyPut<WodController>(() => WodController());
    Get.lazyPut<CreateWodController>(() => CreateWodController());
  }
}
