import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.api) : super(SignupInitial());
  final ApiConsumer api;
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  
 TextEditingController signUpEmail = TextEditingController();
 TextEditingController signUpName = TextEditingController();
 TextEditingController signUpPassword = TextEditingController();

  signup() async{
    emit(SignUPLoading());
    try{
      // ignore: unused_local_variable
      final response = await api.post(EndPoints.signUpUrl,data: {
        ApiKey.name: signUpName.text,
        ApiKey.email: signUpEmail.text,
        ApiKey.password: signUpPassword.text,
      });
      emit(SignUPSuccess());
    }on ServerExceptions catch(e){
      emit(SignUPFailure(errorMsg: e.errorModel.errorMessage));
  }
  }

}






