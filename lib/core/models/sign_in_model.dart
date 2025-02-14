// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:final_project_bootcamp/core/api/end_points.dart';

class SignInModel {
 final String message;
 final String token;
  const SignInModel({
    required this.message,
    required this.token,
  });
  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      message: json[ApiKey.message],
      token: json[ApiKey.token],
    );
  }
}
