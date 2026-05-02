import 'dart:developer';
import 'package:news_app/Core/Contants/constants.dart';
import 'package:news_app/Core/Networking/api_endpoints.dart';
import 'package:news_app/Core/Networking/dio_helper.dart';
import 'package:news_app/Features/HomeScreen/Models/TopHeadLinesModels.dart';

class SearchResultServices {
   getRessultArticles({required String query}) async{
    try {
      final respone =await DioHelper.getrequest(
        Endpoint: ApiEndpoints.EveryThing,
        query: {"q": query, "apiKey": AppConstants.Apikey,"language":AppConstants.lang},
      );
      if (respone.statusCode == 200) {
      ArticleModel  articleModel = ArticleModel.fromJson(respone.data);
      log(articleModel.totalResults.toString());
      return articleModel;
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
