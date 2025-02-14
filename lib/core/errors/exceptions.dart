// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:final_project_bootcamp/core/errors/error_model.dart';

class ServerExceptions implements Exception {
   final ErrorModel errorModel;
  const ServerExceptions({
    required this.errorModel,
  });
   
}



void handleDioException(DioException e) {
   switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case DioExceptionType.sendTimeout:
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case DioExceptionType.receiveTimeout:
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case DioExceptionType.badCertificate:
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case DioExceptionType.cancel:
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case DioExceptionType.connectionError:
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case DioExceptionType.unknown:
          throw ServerExceptions(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case DioExceptionType.badResponse:
          switch (e.response!.statusCode) {
            case 400:
              throw ServerExceptions(
                  errorModel: ErrorModel.fromJson(e.response!.data));
            case 401:
              throw ServerExceptions(
                  errorModel: ErrorModel.fromJson(e.response!.data));
            case 403:
              throw ServerExceptions(
                  errorModel: ErrorModel.fromJson(e.response!.data));
            case 404:
              throw ServerExceptions(
                  errorModel: ErrorModel.fromJson(e.response!.data));
            case 409:
              throw ServerExceptions(
                  errorModel: ErrorModel.fromJson(e.response!.data));
            case 504:
          }
      }
}