import 'package:final_project_bootcamp/core/cache/cache_helper.dart';
import 'package:final_project_bootcamp/core/models/sign_in_model.dart';
import 'package:final_project_bootcamp/features/signup/ui/widgets/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginInitial());
  final ApiConsumer api;
  GlobalKey<FormState> logInKey = GlobalKey<FormState>();

  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  SignInModel? user;
  signin() async {
    emit(LoginLoading());
    try {
      // ignore: unused_local_variable
      final response = await api.post(EndPoints.logInUrl, data: {
        ApiKey.email: signInEmail.text,
        ApiKey.password: signInPassword.text,
      });
      // user = SignInModel.fromJson(response);
      // final decodedToken = JwtDecoder.decode(user!.token);
      //  print(decodedToken['id']);
      // CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      // CacheHelper().saveData(key: ApiKey.id, value: decodedToken['id']);
      emit(LoginSuccess());
    } on ServerExceptions catch (e) {
      emit(LoginFailure(errorMsg: e.errorModel.errorMessage));
    }
  }

//   getUserProfile() async {
//     try {
//       emit(GetUserLoading());
//   final response = await api.get(
//       EndPoints.getUserDataEndPoint(CacheHelper().getData(key: ApiKey.id)));
//       emit(GetUserSuccess(userModel:UserModel.fromJson(response) ));
// } on ServerExceptions catch (e) {
//   emit(GetUserFailure(errorMsg: e.errorModel.errorMessage));
// }
//     //  final response = await
//   }

getUserProfile() async {
  try {
    emit(GetUserLoading());
    final response = await api.get(
      EndPoints.getUserDataEndPoint(CacheHelper().getData(key: ApiKey.id)));
    
    if (response != null && response is Map<String, dynamic>) {
      emit(GetUserSuccess(userModel: UserModel.fromJson(response)));
    } else {
      emit(GetUserFailure(errorMsg: 'Invalid response format'));
    }
  } on ServerExceptions catch (e) {
    emit(GetUserFailure(errorMsg: e.errorModel.errorMessage));
  } catch (e) {
    emit(GetUserFailure(errorMsg: 'An unknown error occurred'));
  }
}

}
