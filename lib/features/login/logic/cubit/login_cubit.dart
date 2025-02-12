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

  signin() async{
    emit(LoginLoading());
    try{
      // ignore: unused_local_variable
      final response = await api.post(EndPoints.logInUrl,data: {
        ApiKey.email: signInEmail.text,
        ApiKey.password: signInPassword.text,
      });
      emit(LoginSuccess());
    }on ServerExceptions catch(e){
      emit(LoginFailure(errorMsg: e.errorModel.errorMessage));
  }
  }
}
