import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/functions/upload_image_to_api.dart';
import '../signup_model.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.api) : super(SignupInitial());
  final ApiConsumer api;
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  
 TextEditingController signUpEmail = TextEditingController();
 TextEditingController signUpName = TextEditingController();
 TextEditingController signUpPassword = TextEditingController();
 TextEditingController signUpConfirmPassword = TextEditingController();
 TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  XFile? profilePic;
//  String? email;
//   String? password;
  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  //  void updateEmailAndPassword(String email, String password, String confirmPassword) {
  //   signUpEmail.text = email;
  //   signUpPassword.text = password;
  //   signUpConfirmPassword.text = confirmPassword;
  // }

  signup() async{
    emit(SignUPLoading());
    try{
      // ignore: unused_local_variable
      final response = await api.post(EndPoints.signUpUrl,isFormData: true,data: {
        ApiKey.name: signUpName.text,
        ApiKey.email: signUpEmail.text,
        ApiKey.password: signUpPassword.text,
        ApiKey.confirmPassword: signUpConfirmPassword.text,
        ApiKey.phone: signUpPhoneNumber.text,
        ApiKey.location: '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',

        ApiKey.profilePic: await uploadImageToApi(profilePic!)
      });
      // SignUpModel signUpModel = SignUpModel.fromJson(response);
      void processResponse(Map<String, dynamic>? response) {
  try {
    if (response != null) {
      SignUpModel signUpModel = SignUpModel.fromJson(response);
      emit(SignUPSuccess(message: signUpModel.msg));
    } else {
      emit(SignUPFailure(errorMsg: 'Response is null'));
    }
  } catch (e) {
    emit(SignUPFailure(errorMsg: e.toString()));
  }
}

      emit(SignUPSuccess(message: response.toString()));
    }on ServerExceptions catch(e){
      emit(SignUPFailure(errorMsg: e.errorModel.errorMessage));
  }
  }
}

//   signup() async {
//     if (signUpEmail.text.isEmpty || signUpPassword.text.isEmpty) {
//       emit(SignUPFailure(errorMsg: "Email and Password cannot be empty"));
//       return;
//     }

//     emit(SignUPLoading());
//     try {
//       final response = await api.post(EndPoints.signUpUrl, isFormData: true, data: {
//         ApiKey.name: signUpName.text,
//         ApiKey.email: signUpEmail.text,
//         ApiKey.password: signUpPassword.text,
//         ApiKey.confirmPassword: signUpConfirmPassword.text,
//         ApiKey.phone: signUpPhoneNumber.text,
//         ApiKey.location: '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
//         ApiKey.profilePic: await uploadImageToApi(profilePic!)
//       });
//       SignUpModel signUpModel = SignUpModel.fromJson(response);
//       emit(SignUPSuccess(message: signUpModel.msg));
//     } on ServerExceptions catch (e) {
//       emit(SignUPFailure(errorMsg: e.errorModel.errorMessage));
//     }
//   }

// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../../core/api/api_consumer.dart';
// import '../../../../core/api/end_points.dart';
// import '../../../../core/errors/exceptions.dart';
// import '../../../../core/functions/upload_image_to_api.dart';
// import '../signup_model.dart';
// part 'signup_state.dart';

// class SignupCubit extends Cubit<SignupState> {
//   SignupCubit(this.api) : super(SignupInitial());
//   final ApiConsumer api;
//   GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  
//   TextEditingController signUpEmail = TextEditingController();
//   TextEditingController signUpName = TextEditingController();
//   TextEditingController signUpPassword = TextEditingController();
//   TextEditingController signUpConfirmPassword = TextEditingController();
//   TextEditingController signUpPhoneNumber = TextEditingController();
//   TextEditingController confirmPassword = TextEditingController();
//   XFile? profilePic;
//   String? email;
//   String? password;
  
//   uploadProfilePic(XFile image) {
//     profilePic = image;
//     emit(UploadProfilePic());
//   }

//   void updateEmailAndPassword(String email, String password, String confirmPassword) {
//     signUpEmail.text = email;
//     signUpPassword.text = password;
//     signUpConfirmPassword.text = confirmPassword;
//   }

//   signup() async {
//     if (signUpEmail.text.isEmpty || signUpPassword.text.isEmpty) {
//       emit(SignUPFailure(errorMsg: "Email and Password cannot be empty"));
//       return;
//     }

//     emit(SignUPLoading());
//     try {
//       final response = await api.post(EndPoints.signUpUrl, isFormData: true, data: {
//         ApiKey.name: signUpName.text,
//         ApiKey.email: signUpEmail.text,
//         ApiKey.password: signUpPassword.text,
//         ApiKey.confirmPassword: signUpConfirmPassword.text,
//         ApiKey.phone: signUpPhoneNumber.text,
//         ApiKey.location: '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
//         ApiKey.profilePic: await uploadImageToApi(profilePic!)
//       });
//       SignUpModel signUpModel = SignUpModel.fromJson(response);
//       emit(SignUPSuccess(message: signUpModel.msg));
//     } on ServerExceptions catch (e) {
//       emit(SignUPFailure(errorMsg: e.errorModel.errorMessage));
//     }
//   }
// }





