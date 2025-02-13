import 'package:final_project_bootcamp/core/api/end_points.dart';

class UserModel {
  final String profilePic;
  final String name;
  final String email;
  // final String password;
  final String phoneNumber;
  final Map<String,dynamic> address;
  // final String location;
  UserModel( {
    required this.address,
    required this.profilePic,
    required this.name,
    required this.email,
    // required this.password,
    required this.phoneNumber, 
    // required this.location,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      profilePic: json['user'][ApiKey.profilePic],
      name: json['user'][ApiKey.name],
      email: json['user'][ApiKey.email],
      phoneNumber: json['user'][ApiKey.phone],
      address: json['user'][ApiKey.location], 

    );
  }
}