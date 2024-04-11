import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nsf/services/auth_service.dart';

class NFSBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put<AuthService>(AuthService(), permanent: true);
  }
}
