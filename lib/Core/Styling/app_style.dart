import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Core/Styling/app_color.dart';

class AppStyle {
  static TextStyle get Headlinestyle => GoogleFonts.inter(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.primaryColor,
  );

  static TextStyle get Secondarylinestyle => GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.secondaryColor,
  );

  static TextStyle get TextButtonstyle => GoogleFonts.inter(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.whitecolor,
  );

  static TextStyle get interw50012gray => GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.GrayHome,
  );

  static TextStyle get interw60018black => GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.blackcolor,
  );
   static TextStyle get interw40012grey => GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColor.greyColor,
  );
}
