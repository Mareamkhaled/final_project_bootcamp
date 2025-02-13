import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/Routing/routes.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_images.dart';
import '../../../../core/resources/app_strings.dart';
import '../../../../core/resources/app_style.dart';
import '../../../../core/widgets/my_button.dart';
import '../../logic/cubit/login_cubit.dart';
import '../widgets/forget_password.dart';
import '../widgets/login_form.dart';
import '../widgets/my_container.dart';

// ignore: must_be_immutable
class LogInView extends StatelessWidget {
  LogInView({super.key});

  // final formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Successfully logged in",
        )));
        Navigator.pushNamed(context, Routes.profile);
      } else if (state is LoginFailure) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(100.h),
                Text(
                  AppStrings.logIn,
                  style: AppStyles.bold28(context)
                      .copyWith(color: AppColors.myBlack),
                ),
                Gap(5.h),
                Text(
                  AppStrings.logInWelcome,
                  style: AppStyles.regular12(context)
                      .copyWith(color: AppColors.myGrey),
                ),
                // style: AppStyle.fontRegular14Grey),
                Gap(30.h),
                LogInForm(),
                // Gap(20.h),
                // Gap(20.h),
                ForgetPassword(),
                Gap(30.h),

                // Gap(MediaQuery.of(context).size.height * 0.03),
                Align(
                  alignment: Alignment.center,
                  child: state is LoginLoading
                      ? CircularProgressIndicator()
                      : MyButton(
                          style: AppStyles.semiBold14(context)
                              .copyWith(color: AppColors.myWhite),
                          onTap: () {
                            validateThenLogin(context);
                            // context.read<LoginCubit>().signin();
                          },
                          text: "Log In",
                          color: AppColors.myBlue,
                        ),
                ),
                Gap(15.h),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "or continue with ",
                      style: AppStyles.semiBold12(context)
                          .copyWith(color: AppColors.myGrey),
                    )),
                Gap(15.h),
                Row(
                  // spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyContainer(img: Assets.assetsImagesGooglePng),
                    // Gap(15.w),
                    MyContainer(img: Assets.assetsImagesApplePng),
                    // Gap(15.w),
                    MyContainer(img: Assets.assetsImagesFaceBookPng)
                  ],
                ),
                Gap(25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don’t have an account? ",
                      style: AppStyles.semiBold12(context)
                          .copyWith(color: AppColors.myGrey),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.register);
                        },
                        child: Text(" Register now ",
                            style: AppStyles.semiBold12(context)
                                .copyWith(color: AppColors.myBlue))),
                  ],
                )
              ],
            ),
          )));
    });
  }

  void validateThenLogin(BuildContext context) {
    if (BlocProvider.of<LoginCubit>(context)
        .logInKey
        .currentState!
        .validate()) {
      context.read<LoginCubit>().signin();
    }
  }
}
