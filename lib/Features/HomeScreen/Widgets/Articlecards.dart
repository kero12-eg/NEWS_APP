import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Core/Routing/App_Routes.dart';
import 'package:news_app/Core/Styling/Widgets/Spacing.dart';
import 'package:news_app/Core/Styling/app_assets.dart';
import 'package:news_app/Core/Styling/app_style.dart';
import 'package:news_app/Features/HomeScreen/Models/TopHeadLinesModels.dart';

class Articlecards extends StatelessWidget {
  const Articlecards({super.key, this.onTap, required this.article});

  final Article article;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: InkWell(
        onTap: onTap ?? (){
          context.push(AppRoutes.detailscreen,extra: article);
        },
        child: ListTile(
          contentPadding: EdgeInsets.zero,
        
          title: Text(
            article.title ?? "",
            maxLines: 2,
            style: AppStyle.interw60018black,
            overflow: TextOverflow.ellipsis,
          ),
        
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing(height: 8.h),
        
              Text(
                article.author ?? "",
                style: AppStyle.interw40012grey,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
        
              Spacing(height: 4.h),
        
              Text(
                article.publishedAt.toString(),
                style: AppStyle.interw40012grey,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              width: 100.w,
              height: 80.h,
              child: article.urlToImage == null || article.urlToImage!.isEmpty
                  ? Image.asset(AppAssets.Applephone)
                  : CachedNetworkImage(
                    imageUrl: article.urlToImage!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.broken_image),
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
