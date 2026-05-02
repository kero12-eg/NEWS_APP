import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Core/Styling/app_assets.dart';
import 'package:news_app/Core/Styling/app_style.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class Listtile extends StatelessWidget {
  const Listtile({super.key, this.Title, this.Subtitle, this.Imageurl});
  final String? Title;
  final String? Subtitle;
  final String? Imageurl;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        Title ?? LocaleKeys.title.tr(),
        style: AppStyle.interw60018black,
      ),
      subtitle: Text(
        Subtitle ?? LocaleKeys.date.tr(),
        style: AppStyle.interw40012grey,
      ),
      trailing: Image.asset(Imageurl ?? AppAssets.Applephone),
    );
  }
}
