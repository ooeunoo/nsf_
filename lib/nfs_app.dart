import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nsf/controllers/theme/theme.controller.dart';
import 'package:nsf/nfs_bindings.dart';
import 'package:nsf/nfs_translation.dart';
import 'package:nsf/routes/app_pages.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/theme.dart';

class NSFApp extends StatelessWidget {
  const NSFApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return ScreenUtilInit(
        designSize: Size(AppDimens.screenW, AppDimens.screenH),
        builder: (context, __) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "전국체전",
            defaultTransition: Transition.fade,
            getPages: AppPages.routes,
            initialRoute: AppPages.initial,
            initialBinding: NFSBinding(),
            theme: themeLight(context),
            darkTheme: themeDark(context),
            themeMode: getThemeMode(themeController.theme),
            translations: NFSTranslations(),
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('ko', 'KR'),
          );
        });
  }

  ThemeMode getThemeMode(String type) {
    ThemeMode themeMode = ThemeMode.system;
    switch (type) {
      case "system":
        themeMode = ThemeMode.system;
        break;
      case "dark":
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }

    return themeMode;
  }
}
