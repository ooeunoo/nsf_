import 'package:get/get.dart';

showSnakBar(
  String message,
) {
  Get.snackbar(
    'This is a snackbar',
    '',
    snackPosition: SnackPosition.BOTTOM,
  );
}
