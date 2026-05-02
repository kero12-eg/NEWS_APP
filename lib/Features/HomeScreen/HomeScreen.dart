import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Core/Contants/constants.dart';
import 'package:news_app/Core/Routing/App_Routes.dart';
import 'package:news_app/Core/Styling/Widgets/Spacing.dart';
import 'package:news_app/Core/Styling/app_assets.dart';
import 'package:news_app/Core/Styling/app_color.dart';
import 'package:news_app/Core/Styling/app_style.dart';
import 'package:news_app/Features/HomeScreen/Models/TopHeadLinesModels.dart';
import 'package:news_app/Features/HomeScreen/Services/Home_Screen_Services.dart';
import 'package:news_app/Features/HomeScreen/Widgets/Articlecards.dart';
import 'package:news_app/Features/HomeScreen/Widgets/NavBar.dart';
import 'package:news_app/Features/HomeScreen/Widgets/TopHeadlinesWidget.dart';
import 'package:news_app/generated/locale_keys.g.dart';

List<String> title = [
  LocaleKeys.title.tr(),
  LocaleKeys.title.tr(),
  LocaleKeys.title.tr(),
  LocaleKeys.title.tr(),
];

List<String> subtitle = [
  LocaleKeys.date.tr(),
  LocaleKeys.date.tr(),
  LocaleKeys.date.tr(),
  LocaleKeys.title.tr(),
];
List<String> image = [
  AppAssets.Applephone,
  AppAssets.boat,
  AppAssets.thing,
  AppAssets.plane,
];

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    HomeScreenServices().getTopHeadlinesArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.AppBarColor,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Text(LocaleKeys.explore.tr(), style: AppStyle.Headlinestyle),
        ),
        actions: [
          IconButton(onPressed: () {
            context.pushReplacementNamed(AppRoutes.searchscreen);
          },
           icon: Icon(Icons.search)),
           IconButton(onPressed: (){
            if(context.locale==Locale("en")){
              context.setLocale(Locale("ar"));
            }
            else{
              context.setLocale(Locale("en"));
            }
            AppConstants.lang = context.locale.toString();
           }, icon: Icon(Icons.language)),
          Spacing(width: 16.w),
        ],
      ),
      body: FutureBuilder(
        future: HomeScreenServices().getTopHeadlinesArticles(),
        builder: (context, Snapshot) {
          if (Snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (Snapshot.hasError) {
            return Center(child: Text(Snapshot.error.toString()));
          } else if (Snapshot.hasData) {
            ArticleModel articleModel =
                Snapshot.data as ArticleModel;
            if (articleModel.totalResults == 0) {
              return Center(child: Text(LocaleKeys.nodata.tr()));
            }
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    SizedBox(
                      width: 430.w,
                      child: Row(
                        mainAxisAlignment: .spaceEvenly,
                        children: [
                          NavBar(
                            title: LocaleKeys.travel.tr(),
                            onPressed: () {
                              context.pushNamed(AppRoutes.searchresultsscreen,extra: "travel");
                            },
                          ),
                          NavBar(
                            title: LocaleKeys.technology.tr(),
                            onPressed: () {
                              context.pushNamed(AppRoutes.searchresultsscreen,extra: "technology");
                            },
                          ),
                          NavBar(
                            title: LocaleKeys.business.tr(),
                            onPressed: () {
                              context.pushNamed(AppRoutes.searchresultsscreen,extra: "business");
                            },
                          ),
                          NavBar(title: LocaleKeys.entertainment.tr(),
                          onPressed: () {
                            
                            context.pushNamed(AppRoutes.searchresultsscreen,extra: "entertainment");
                          },),
                        ],
                      ),
                    ),
                    Spacing(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Topheadlineswidget(
                            imageurl: articleModel.articles![0].urlToImage,
                            title: articleModel.articles![0].title,
                            Autor: articleModel.articles![0].author,
                            publishedAt: DateFormat("yyyy-MM-dd - kk:mm")
                                .format(
                                  articleModel.articles![0].publishedAt!,
                                ),
                          ),
                          Spacing(height: 29.h),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: articleModel.articles!.length,
                            itemBuilder: (context, index) {
                              Article article =
                                  articleModel.articles![index];
                              return Articlecards(
                                article: article,
                                onTap: () {
                                  context.pushNamed(
                                    AppRoutes.detailscreen,
                                    extra: article,
                                  );
                                },
                                
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text("No Data"));
          }
        },
      ),
    );
  }
}
