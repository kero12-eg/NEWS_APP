import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Core/Styling/app_color.dart';
import 'package:news_app/Core/Styling/app_style.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key, this.onPressed, this.title, this.style,
  });

final VoidCallback? onPressed;
final String? title;
final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
       title ??  LocaleKeys.entertainment.tr(),
        style: style ?? AppStyle.interw60018black.copyWith(
          fontSize: 14.sp,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}