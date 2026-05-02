import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Core/Styling/Widgets/Spacing.dart';
import 'package:news_app/Core/Styling/app_assets.dart';
import 'package:news_app/Core/Styling/app_style.dart';

class Topheadlineswidget extends StatelessWidget {
  const Topheadlineswidget({
    super.key,
    this.title,
    this.Autor,
    this.publishedAt,
    this.imageurl,
  });
  final String? title;
  final String? Autor;
  final String? publishedAt;
  final String? imageurl;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        imageurl != null ?
        CachedNetworkImage(
          width: 366.w,
          height: 206.h,
          imageUrl: imageurl ?? "",
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ):Image.asset(AppAssets.logo),
        Spacing(height: 16.h),
        Text(title ?? "", style: AppStyle.interw60018black),
        Spacing(height: 12.h),
        Row(
          children: [
            Text(Autor ?? "", style: AppStyle.interw40012grey),
            Spacing(width: 4.w),
            Text(
              publishedAt ?? "",
              style: AppStyle.interw40012grey,
            )
          ],
        ),
      ],
    );
  }
}
