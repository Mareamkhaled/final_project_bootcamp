
import '../api/end_points.dart';

class ErrorModel {
  final int statusCode;
  final String errorMessage;

  ErrorModel({required this.statusCode, required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      statusCode: json[ApiKey.status],
      errorMessage: json[ApiKey.errorMsg],


    );

  }
}