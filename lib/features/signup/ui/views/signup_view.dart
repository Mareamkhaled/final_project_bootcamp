import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/Routing/routes.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_strings.dart';
import '../../../../core/resources/app_style.dart';
import '../../../../core/widgets/my_button.dart';
import '../../logic/cubit/signup_cubit.dart';
import '../widgets/signup_form.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  // final formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(listener: (context, state) {
      if (state is SignUPSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          state.message,
        )));
        Navigator.pushNamed(context, Routes.profile);

      } else if (state is SignUPFailure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          state.errorMsg,
        )));
      }
    }, builder: (context, state) {
      return Scaffold(
          // appBar: CustomAppBar(text: "Login"),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Gap(100.h),
                  Text(
                    AppStrings.signUp,
                    style: AppStyles.bold28(context)
                        .copyWith(color: AppColors.myBlack),
                  ),
                  Gap(10.h),
                Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: 130,
                          height: 130,
                          child: context.read<SignupCubit>().profilePic == null
                              ? CircleAvatar(
                                  backgroundColor:
                                      AppColors.myBlue.withOpacity(0.2),
                                  // backgroundImage: const AssetImage("assets/images/avatar.png"),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: GestureDetector(
                                          onTap: () async {},
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: AppColors.myBlue,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 3),
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                ImagePicker()
                                                    .pickImage(
                                                        source:
                                                            ImageSource.gallery)
                                                    .then((value) =>
                                                        context
                                                            .read<SignupCubit>()
                                                            .uploadProfilePic(
                                                                value!)
                                                        );
                                              },
                                              child: const Icon(
                                                Icons.camera_alt_sharp,
                                                color: Colors.white,
                                                size: 25,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(File(context
                                      .read<SignupCubit>()
                                      .profilePic!
                                      .path)),
                                ))),
                  Gap(5.h),
                  Text(
                    AppStrings.signUpWelcome,
                    style: AppStyles.regular12(context)
                        .copyWith(color: AppColors.myGrey),
                  ),
                  // style: AppStyle.fontRegular14Grey),
                  Gap(30.h),
                  SignupForm(),
                  // Gap(20.h),
                  // Gap(20.h),
                  // ForgetPassword(),
                  Gap(30.h),
              
                  // Gap(MediaQuery.of(context).size.height * 0.03),
                  Align(
                    alignment: Alignment.center,
                    child: state is SignUPLoading
                        ? CircularProgressIndicator()
                        : MyButton(
                            style: AppStyles.semiBold14(context)
                                .copyWith(color: AppColors.myWhite),
                            onTap: () {
      // context.read<SignupCubit>().signup();
                              
                              validateThenSignUp(context);
                              // Navigator.pushNamed(context, Routes.register2);
                              // context.read<LoginCubit>().signin();
                            },
                            text: "Register",
                            color: AppColors.myBlue,
                          ),
                  ),
                  Gap(15.h),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "have an account? ",
                        style: AppStyles.semiBold12(context)
                            .copyWith(color: AppColors.myGrey),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.login);
                          },
                          child: Text(" Login now ",
                              style: AppStyles.semiBold12(context)
                                  .copyWith(color: AppColors.myBlue))),
                    ],
                  )
                ],
              ),
            ),
          )));
    });
  }

 void validateThenSignUp(BuildContext context) {
    if (BlocProvider.of<SignupCubit>(context)
        .signUpKey
        .currentState!
        .validate()) {
      
      context.read<SignupCubit>().signup();
     
    }
  }
  }

// void validateThenSignUp(BuildContext context) {
//     final email = BlocProvider.of<SignupCubit>(context).signUpEmail.text;
//     final password = BlocProvider.of<SignupCubit>(context).signUpPassword.text;
//     final confirmPassword = BlocProvider.of<SignupCubit>(context).signUpConfirmPassword.text;
    
//     if (email.isEmpty || password.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email and Password cannot be empty")));
//         return;
//     }

//     if (BlocProvider.of<SignupCubit>(context).signUpKey.currentState!.validate()) {
//       BlocProvider.of<SignupCubit>(context).updateEmailAndPassword(email, password, confirmPassword);
      
//       Navigator.pushNamed(
//         context,
//         Routes.register2,
//         arguments: {
//           'email': email,
//           'password': password,
//           'confirmPassword': confirmPassword,
//         },
//       );
//     }
// }

// }


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import '../../../../core/Routing/routes.dart';
// import '../../../../core/resources/app_colors.dart';
// import '../../../../core/resources/app_strings.dart';
// import '../../../../core/resources/app_style.dart';
// import '../../../../core/widgets/my_button.dart';
// import '../../logic/cubit/signup_cubit.dart';
// import '../widgets/signup_form.dart';

// class SignUpView extends StatelessWidget {
//   SignUpView({super.key});

//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SignupCubit, SignupState>(listener: (context, state) {
//       if (state is SignUPSuccess) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text(
//           "Successfully logged in",
//         )));
//         Navigator.pushNamed(context, Routes.test);
//       } else if (state is SignUPFailure) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text(
//           state.errorMsg,
//         )));
//       }
//     }, builder: (context, state) {
//       return Scaffold(
//           resizeToAvoidBottomInset: false,
//           body: SafeArea(
//               child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Gap(100.h),
//                 Text(
//                   AppStrings.signUp,
//                   style: AppStyles.bold28(context)
//                       .copyWith(color: AppColors.myBlack),
//                 ),
//                 Gap(5.h),
//                 Text(
//                   AppStrings.signUpWelcome,
//                   style: AppStyles.regular12(context)
//                       .copyWith(color: AppColors.myGrey),
//                 ),
//                 Gap(30.h),
//                 SignupForm(),
//                 Gap(30.h),
//                 Align(
//                   alignment: Alignment.center,
//                   child: state is SignUPLoading
//                       ? CircularProgressIndicator()
//                       : MyButton(
//                           style: AppStyles.semiBold14(context)
//                               .copyWith(color: AppColors.myWhite),
//                           onTap: () {
//                             validateThenSignUp(context);
//                           },
//                           text: "Next",
//                           color: AppColors.myBlue,
//                         ),
//                 ),
//                 Gap(15.h),
//               ],
//             ),
//           )));
//     });
//   }

//   void validateThenSignUp(BuildContext context) {
//     final email = BlocProvider.of<SignupCubit>(context).signUpEmail.text;
//     final password = BlocProvider.of<SignupCubit>(context).signUpPassword.text;
//     final confirmPassword = BlocProvider.of<SignupCubit>(context).signUpConfirmPassword.text;
    
//     if (email.isEmpty || password.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email and Password cannot be empty")));
//         return;
//     }

//     if (BlocProvider.of<SignupCubit>(context).signUpKey.currentState!.validate()) {
//       BlocProvider.of<SignupCubit>(context).updateEmailAndPassword(email, password, confirmPassword);
      
//       Navigator.pushNamed(
//         context,
//         Routes.register2,
//         arguments: {
//           'email': email,
//           'password': password,
//           'confirmPassword': confirmPassword,
//         },
//       );
//     }
//   }
// }


 
      // BlocProvider.of<SignupCubit>(context).updateEmailAndPassword(email, password, confirmPassword);
      
      // Navigator.pushNamed(
      //   context,
      //   Routes.register2,
      //   arguments: {
      //     'email': email,
      //     'password': password,
      //     'confirmPassword': confirmPassword,
      //   },
      // );