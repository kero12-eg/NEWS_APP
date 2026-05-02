import 'package:flutter/material.dart';
import 'package:news_app/Core/Styling/app_color.dart';

import 'package:news_app/Core/Styling/app_style.dart';

class AppTheme {
  static ThemeData get lightcolor => ThemeData(
        primaryColor: AppColor.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          titleLarge: AppStyle.Headlinestyle,
          titleMedium: AppStyle.Secondarylinestyle,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColor.primaryColor,
          disabledColor: AppColor.Greycolor,
          textTheme: ButtonTextTheme.primary,
        ),
      );
}
