import 'package:go_router/go_router.dart';
import 'package:news_app/Core/Routing/App_Routes.dart';
import 'package:news_app/Features/DetailsScreen/DetailsScreen.dart';
import 'package:news_app/Features/HomeScreen/HomeScreen.dart';
import 'package:news_app/Features/HomeScreen/Models/TopHeadLinesModels.dart';
import 'package:news_app/Features/SearchResultScreen/SearchResultScreen.dart';
import 'package:news_app/Features/SearchScreen/SearchScreen.dart';

class RouterGen {
  static GoRouter router = GoRouter(
    initialLocation: AppRoutes.homescreen,
    routes: [
      GoRoute(
        path: AppRoutes.homescreen,
        name: AppRoutes.homescreen,
        builder: (context, state) => Homescreen(),
      ),

      GoRoute(
        path: AppRoutes.searchscreen,
        name: AppRoutes.searchscreen,
        builder: (context, state) => Searchscreen(),
      ),

      GoRoute(
        path: AppRoutes.searchresultsscreen,
        name: AppRoutes.searchresultsscreen,
        builder: (context, state) {
          final query = state.extra as String;
          return Searchresultscreen(query: query);
        },
      ),
      GoRoute(
        path: AppRoutes.detailscreen,
        name: AppRoutes.detailscreen,
        builder: (context, state) {
          final Article article = state.extra as Article; 
          return Detailsscreen(article: article);
        },
      ),
    ],
  );
}
