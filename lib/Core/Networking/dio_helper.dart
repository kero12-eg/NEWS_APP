import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:news_app/Core/Networking/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;
  static void initDio() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio!.interceptors.add(PrettyDioLogger());
  }

  static Future<Response<dynamic>> getrequest({
    required String Endpoint,
    required Map<String, dynamic> query,
  }) async {
    try {
      var response = await dio!.get(Endpoint, queryParameters: query);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  static Future<Response<dynamic>> postrequest({
    required String Endpoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      var response = await dio!.post(Endpoint, data: data);
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
