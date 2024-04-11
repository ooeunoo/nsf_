import 'package:get/route_manager.dart';
import 'package:nsf/bindings/root.binding.dart';
import 'package:nsf/views/login/login.dart';
import 'package:nsf/views/root/root.dart';

class AppPages {
  static const initial = '/root';

  static final routes = [
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: _Paths.root,
      page: () => RootView(),
      binding: RootBinding(),
    ),
  ];
}

abstract class Routes {
  Routes._();
  static const root = _Paths.root;
  static const login = _Paths.login;
}

abstract class _Paths {
  _Paths._();
  static const root = '/root';
  static const login = '/login';
}
