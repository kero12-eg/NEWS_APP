import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spacing extends StatelessWidget {
  const Spacing({
    super.key, this.height, this.width,
  });
final double? height;
final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 0.w,
      height: height ?? 0.h,
    );
  }
}