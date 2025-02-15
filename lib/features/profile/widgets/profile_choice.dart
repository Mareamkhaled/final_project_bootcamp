import 'choice_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/helpers/get_font_size.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_controllers.dart';
import '../../../core/resources/app_strings.dart';
import '../../../core/resources/app_style.dart';

class ProfileChoice extends StatefulWidget {
  const ProfileChoice({super.key});

  @override
  State<ProfileChoice> createState() => _ProfileChoiceState();
}

class _ProfileChoiceState extends State<ProfileChoice> {
  void saveUserInfo() {
    setState(() {
      AppStrings.name = AppControllers.nameController.text;
      AppStrings.email = AppControllers.emailController.text;
      AppStrings.defaultName = AppControllers.nameController.text;
      AppStrings.defaultEmail = AppControllers.emailController.text;
    });
  }

  void cancelEdit() {
    setState(() {
      AppControllers.nameController.text = AppStrings.defaultName;
      AppControllers.emailController.text = AppStrings.defaultEmail;
    });
  }

  @override
  void initState() {
    super.initState();
    // AppControllers.nameController.text = AppStrings.name;
    // AppControllers.emailController.text = AppStrings.email;
    //  super.initState();
    AppStrings.name;
    AppStrings.email;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceButton(
          onTap: cancelEdit,
          color: AppColors.myWhite,
          text: "Cancel",
          border: Border.all(color: AppColors.myRed),
          style: AppStyles.semiBold.copyWith(
            color: AppColors.myRed,
            fontSize: getFontSize(context, 14),
          ),
        ),
        Gap(40.w),
        ChoiceButton(
          onTap: saveUserInfo,
          border: Border.all(color: AppColors.myBlue, width: 2),
          color: AppColors.myBlue,
          text: "Save",
          style: AppStyles.semiBold.copyWith(
            color: AppColors.myWhite,
            fontSize: getFontSize(context, 14),
          ),
        ),
      ],
    );
  }
}
