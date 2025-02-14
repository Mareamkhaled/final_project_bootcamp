import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/Routing/routes.dart';
import '../../../../core/helpers/get_font_size.dart';
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

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Successfully logged in"),
        ));
        context.read<LoginCubit>().getUserProfile();
        Navigator.pushNamed(context, Routes.allProducts);
      } else if (state is LoginFailure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.errorMsg),
        ));
      } else if (state is GetUserSuccess) {
        Navigator.pushNamed(context, Routes.profile);
      }
    }, builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(100.h),
                Text(
                  AppStrings.logIn,
                  style: AppStyles.bold
                      .copyWith(color: AppColors.myBlack, fontSize: getFontSize(context, 28)),
                ),
                Gap(5.h),
                Text(
                  AppStrings.logInWelcome,
                  style: AppStyles.regular
                      .copyWith(color: AppColors.myGrey, fontSize: getFontSize(context, 12)),
                ),
                Gap(30.h),
                LogInForm(),
                ForgetPassword(),
                Gap(30.h),
                Align(
                  alignment: Alignment.center,
                  child: state is LoginLoading
                      ? CircularProgressIndicator()
                      : MyButton(
                          style: AppStyles.semiBold
                              .copyWith(color: AppColors.myWhite, fontSize: getFontSize(context, 14)),
                          onTap: () {
                            validateThenLogin(context);
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
                    style: AppStyles.semiBold
                        .copyWith(color: AppColors.myGrey, fontSize: getFontSize(context, 12)),
                  ),
                ),
                Gap(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyContainer(img: Assets.assetsImagesGooglePng),
                    MyContainer(img: Assets.assetsImagesApplePng),
                    MyContainer(img: Assets.assetsImagesFaceBookPng)
                  ],
                ),
                Gap(25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don’t have an account? ",
                      style: AppStyles.semiBold
                          .copyWith(color: AppColors.myGrey, fontSize: getFontSize(context, 12)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.register);
                      },
                      child: Text(" Register now ",
                          style: AppStyles.semiBold
                              .copyWith(color: AppColors.myBlue, fontSize: getFontSize(context, 12))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
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

