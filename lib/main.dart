import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Core/Contants/constants.dart';
import 'package:news_app/Core/Networking/dio_helper.dart';
import 'package:news_app/Core/Routing/router_gen.dart';
import 'package:news_app/Core/Styling/app_theme.dart';
import 'package:news_app/generated/codegen_loader.g.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
 DioHelper.initDio();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/Translations',
      fallbackLocale: Locale("ar"),
      startLocale: Locale(AppConstants.lang),
      assetLoader: const CodegenLoader(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: RouterGen.router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightcolor,
          title: "News App",
        );
      },
    );
  }
}
