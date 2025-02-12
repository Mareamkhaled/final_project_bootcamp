import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/form_validate.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../../logic/cubit/login_cubit.dart';


class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: BlocProvider.of<LoginCubit>(context).logInKey,
            child: Column(
              children: [
                MyTextFormField(
                  prefixIcon: Icon(Icons.email_outlined),

                  controller: BlocProvider.of<LoginCubit>(context).signInEmail,
                  validator: FormValidator.validateEmail,
                  text: "Email",
                  hintText: "Enter your email",
                ),
                Gap(30.h),
                MyTextFormField(
                 suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObsecure = !isObsecure;
                    });
                  },
                  icon: isObsecure
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
                  prefixIcon: Icon(Icons.lock_outline),
                  isObscureText: true,
                  controller:
                      BlocProvider.of<LoginCubit>(context).signInPassword,
                  validator: FormValidator.validatePassword,
                  text: "Password",
                  hintText: "Enter your password",
                
                ),
              ],
            )),
        Gap(20.h),
      ],
    );
  }
}
