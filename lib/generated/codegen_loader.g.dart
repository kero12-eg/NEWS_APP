// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "explore": "استكشف",
  "travel": "سفر",
  "technology": "تقنية",
  "cancel": "إلغاء",
  "searchresult": "نتائج البحث",
  "business": "الأعمال",
  "entertainment": "الترفيه",
  "title": "أبل تكشف عن ميزات الذكاء الاصطناعي الثورية",
  "date": "كيرلس. 20 مايو 2023",
  "nodata": "لا نتائج",
  "search": "نتائج البحث",
  "Valid": "يرجى إدخال نص صالح"
};
static const Map<String,dynamic> _en = {
  "explore": "Explore",
  "travel": "Travel",
  "technology": "Technology",
  "cancel": "Cancel",
  "searchresult": "Search results",
  "business": "Business",
  "entertainment": "Entertainment",
  "title": "Apple Unveils Revolutionary AI Features",
  "date": "Kirolos . May 20, 2023",
  "nodata": "No Result",
  "search": "Search Result",
  "Valid": "Please Enter Valid Text"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
