import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({
    super.key,
    this.controller,
    this.validator,
    this.onpressed1,
    this.onpressed2,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final VoidCallback? onpressed1;
  final VoidCallback? onpressed2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 331.w,
      height: 56.h,
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: TextInputType.webSearch,
        autofocus: true,
      
        textAlignVertical: TextAlignVertical.center,
      
        decoration: InputDecoration(
          isDense: true,
          filled: true,
      
          helperText: ' ',
      
          helperStyle: TextStyle(fontSize: 10.sp, height: 1),
      
          errorStyle: TextStyle(fontSize: 10.sp, height: 1, color: Colors.red),
      
          errorMaxLines: 1,
      
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
      
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
      
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.blueAccent, width: 1.w),
          ),
      
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
      
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
      
          prefixIcon: IconButton(
            onPressed: onpressed1,
            icon: const Icon(Icons.search),
          ),
      
          suffixIcon: IconButton(
            onPressed: onpressed2,
            icon: const Icon(Icons.cancel),
          ),
        ),
      ),
    );
  }
}
