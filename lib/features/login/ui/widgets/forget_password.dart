import 'package:flutter/material.dart';

import '../../../../core/helpers/get_font_size.dart';
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
      AppStyles.regular.copyWith(color: AppColors.myGrey, fontSize: getFontSize(context, 12)),
      ),]
    );
  }
}