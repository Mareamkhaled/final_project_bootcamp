// ignore_for_file: use_build_context_synchronously, duplicate_ignore

// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:final_project_bootcamp/core/helpers/get_font_size.dart';
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

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignUPSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Sign up successful"),
          ));
          Navigator.pushNamed(context, Routes.allProducts);
        } else if (state is SignUPFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMsg),
          ));
        } 
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.signUp,
                      style: AppStyles.bold.copyWith(
                        color: AppColors.myBlack,
                        fontSize: getFontSize(context, 24),
                      ),
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
                                    // ignore: deprecated_member_use
                                    AppColors.myBlue.withOpacity(0.2),
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
                                              width: 3,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              ImagePicker()
                                                  .pickImage(
                                                    source: ImageSource.gallery,
                                                  )
                                                  // ignore: use_build_context_synchronously
                                                  // ignore: use_build_context_synchronously
                                                  .then((value) => context
                                                      .read<SignupCubit>()
                                                      .uploadProfilePic(
                                                          value!));
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
                              ),
                      ),
                    ),
                    Gap(5.h),
                    Text(
                      AppStrings.signUpWelcome,
                      style: AppStyles.regular.copyWith(
                        color: AppColors.myGrey,
                        fontSize: getFontSize(context, 12),
                      ),
                    ),
                    Gap(30.h),
                    SignupForm(),
                    Gap(30.h),
                    Align(
                      alignment: Alignment.center,
                      child: state is SignUPLoading
                          ? CircularProgressIndicator()
                          : MyButton(
                              style: AppStyles.semiBold.copyWith(
                                color: AppColors.myWhite,
                                fontSize: getFontSize(context, 14),
                              ),
                              onTap: () {
                                validateThenSignUp(context);
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
                          "Have an account? ",
                          style: AppStyles.semiBold.copyWith(
                            color: AppColors.myGrey,
                            fontSize: getFontSize(context, 12),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.login);
                          },
                          child: Text(
                            "Login now",
                            style: AppStyles.semiBold.copyWith(
                              color: AppColors.myBlue,
                              fontSize: getFontSize(context, 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void validateThenSignUp(BuildContext context) {
    if (BlocProvider.of<SignupCubit>(context)
        .signUpKey
        .currentState!
        .validate()) {
      if (context.read<SignupCubit>().profilePic == null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: AppColors.myWhite,
              title: Text(
                "Upload your image",
                style: AppStyles.bold.copyWith(
                  color: AppColors.myRed,
                  fontSize: getFontSize(context, 18),
                ),
              ),
              content: Text(
                "Please enter your image",
                style: AppStyles.regular.copyWith(
                  color: AppColors.myGrey,
                  fontSize: getFontSize(context, 14),
                ),
              ),
              actions: [
                TextButton(
                  child: Text(
                    "OK",
                    style: AppStyles.bold.copyWith(
                      color: AppColors.myBlue,
                      fontSize: getFontSize(context, 18),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        context.read<SignupCubit>().signup();
      }
    }
  }
}

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please check your email to verify your account.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<SignupCubit>().verifyEmail();
              },
              child: Text('I have verified my email'),
            ),
          ],
        ),
      ),
    );
  }
}
