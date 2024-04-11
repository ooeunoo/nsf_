import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsf/utils/styles/color.dart';
import 'package:nsf/utils/styles/dimens.dart';
import 'package:nsf/utils/styles/font.dart';

/// Light theme
ThemeData themeLight(BuildContext context) => ThemeData(
      fontFamily: 'Pretendard',
      useMaterial3: true,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: AppColor.gray100,
      appBarTheme: const AppBarTheme(backgroundColor: AppColor.gray100),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.gray100,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme:
              IconThemeData(size: AppDimens.size24, color: AppColor.gray900),
          unselectedIconTheme:
              IconThemeData(size: AppDimens.size24, color: AppColor.gray500),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: Theme.of(context)
              .textTheme
              .textXS
              .copyWith(color: AppColor.gray900),
          unselectedLabelStyle: Theme.of(context)
              .textTheme
              .textXS
              .copyWith(color: AppColor.gray500)),
    );

/// Light theme
ThemeData themeDark(BuildContext context) => ThemeData(
      fontFamily: 'Pretendard',
      useMaterial3: true,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: AppColor.gray100,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.bluelight100,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme:
            IconThemeData(size: AppDimens.size24, color: AppColor.brand500),
        unselectedIconTheme:
            IconThemeData(size: AppDimens.size24, color: AppColor.gray500),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      tabBarTheme: const TabBarTheme(
        indicatorColor: AppColor.white,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
    );

extension CustomTextStyles on TextTheme {
  TextStyle get display2XL => TextStyle(fontSize: 72.sp);
  TextStyle get displayXL => TextStyle(fontSize: 60.sp);
  TextStyle get displayLG => TextStyle(fontSize: 48.sp);
  TextStyle get displayMD => TextStyle(fontSize: 36.sp);
  TextStyle get displaySM => TextStyle(fontSize: 30.sp);
  TextStyle get displayXS => TextStyle(fontSize: 24.sp);
  TextStyle get textXL => (TextStyle(fontSize: 20.sp, color: AppColor.gray900));
  TextStyle get textLG => TextStyle(fontSize: 18.sp, color: AppColor.gray800);
  TextStyle get textMD => TextStyle(fontSize: 16.sp, color: AppColor.gray700);
  TextStyle get textSM => TextStyle(fontSize: 14.sp, color: AppColor.gray600);
  TextStyle get textXS => TextStyle(fontSize: 12.sp, color: AppColor.gray500);
}
