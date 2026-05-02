import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Core/Contants/constants.dart';
import 'package:news_app/Core/Styling/Widgets/Spacing.dart';
import 'package:news_app/Core/Styling/app_color.dart';
import 'package:news_app/Core/Styling/app_style.dart';
import 'package:news_app/Features/HomeScreen/Models/TopHeadLinesModels.dart';

class Detailsscreen extends StatelessWidget {
  const Detailsscreen({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.red,
        child: Stack(
          children: [
            SizedBox(
              width: 430.w,
              height: 316.h,
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                fit: BoxFit.fill,
              ),
            ),
            AppConstants.lang == "en" ? Positioned(
              top: 50.h,
              left: 20.w,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blueAccent,
                ),
              ),
            ):Positioned(
              top: 50.h,
              right: 20.w,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Positioned(
              top: 300.h,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                    vertical: 24.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title ?? "",
                        style: AppStyle.interw60018black,
                      ),
                      Spacing(height: 16.h),
                      Text(
                        "${article.author} . ${DateFormat('yyyy-MM-dd').format(article.publishedAt!)}",
                        style: AppStyle.interw40012grey,
                      ),
                      Spacing(height: 24.h),
                      Text(
                        article.description ?? "",
                        style: AppStyle.interw40012grey.copyWith(
                          fontSize: 16.sp,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
