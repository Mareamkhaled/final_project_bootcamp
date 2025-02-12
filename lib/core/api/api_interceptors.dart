import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["token"] = "application/json";
    super.onRequest(options, handler);
  }
}