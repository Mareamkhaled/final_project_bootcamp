import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_style.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.end,
      children:[ Text("Forget Password?",style: 
      AppStyles.regular12(context).copyWith(color: AppColors.myGrey),
      ),]
    );
  }
}