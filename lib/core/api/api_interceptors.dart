import 'package:dio/dio.dart';
import 'package:final_project_bootcamp/core/api/end_points.dart';
import 'package:final_project_bootcamp/core/cache/cache_helper.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper().getData(key: ApiKey.token) != null
            ? "E-COMMERCE API ${CacheHelper().getData(key: ApiKey.token)}"
            : null;
    super.onRequest(options, handler);
  }
}
