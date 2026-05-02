import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Core/Contants/constants.dart';
import 'package:news_app/Features/HomeScreen/Models/TopHeadLinesModels.dart';
import 'package:news_app/Features/HomeScreen/Widgets/Articlecards.dart';
import 'package:news_app/Features/SearchResultScreen/Services/SearchResultServices.dart';
import 'package:news_app/generated/locale_keys.g.dart';

class Searchresultscreen extends StatelessWidget {
  const Searchresultscreen({super.key, required this.query});
final String query;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(LocaleKeys.search.tr()),
        actions: [
          IconButton(
            onPressed: () {
              if (context.locale == const Locale('en')) {
                context.setLocale(const Locale('ar'));
              } else {
                context.setLocale(const Locale('en'));
              }
              AppConstants.lang = context.locale.toString();
            },
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: FutureBuilder(future: SearchResultServices().getRessultArticles(query: query), builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
        else if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()),);
        }
        else if(snapshot.hasData){
          ArticleModel articleModel = snapshot.data! as ArticleModel;
          return ListView.builder(
            
            itemCount: articleModel.articles!.length,
            itemBuilder: (context, index) {
              Article article = articleModel.articles![index];
              return Articlecards(
                 article: article,
              );
            },
          );
        }
        else{
          return const Center(child: Text("No Data Found"),);
        }
      }),
    );
  }
}
