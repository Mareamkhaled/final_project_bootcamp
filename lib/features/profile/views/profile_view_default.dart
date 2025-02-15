// ignore_for_file: unused_import
import '../widgets/contact_form.dart';
import '../widgets/profile_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/helpers/form_validate.dart';
import '../../../core/helpers/get_font_size.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_controllers.dart';
import '../../../core/resources/app_strings.dart';
import '../../../core/resources/app_style.dart';
import '../widgets/choice_button.dart';
import '../widgets/contact_text_field.dart';
import '../widgets/profile_container.dart';

class ProfileScreenDefault extends StatefulWidget {
  const ProfileScreenDefault({super.key});

  @override
  State<ProfileScreenDefault> createState() => _ProfileScreenDefaultState();
}

class _ProfileScreenDefaultState extends State<ProfileScreenDefault> {
  void saveUserInfo() {
    setState(() {
      AppStrings.name = AppControllers.nameController.text;
      AppStrings.email = AppControllers.emailController.text;
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
    AppStrings.name;
    AppStrings.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              size: 30,
              color: AppColors.myBlack,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: AppColors.myBlue,
        title: Text('Profile',
            style: AppStyles.semiBold.copyWith(
                color: AppColors.myBlack, fontSize: getFontSize(context, 16))),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileContainer(),
            SizedBox(height: 20),
            ContactForm(),
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceButton(
                  onTap: cancelEdit,
                  color: AppColors.myWhite,
                  text: "Cancel",
                  border: Border.all(
                    color: AppColors.myRed,
                  ),
                  style: AppStyles.semiBold.copyWith(
                      color: AppColors.myRed,
                      fontSize: getFontSize(context, 14)),
                ),
                Gap(40.w),
                ChoiceButton(
                  onTap: saveUserInfo,
                  border: Border.all(color: AppColors.myBlue, width: 2),
                  color: AppColors.myBlue,
                  text: "Save",
                  style: AppStyles.semiBold.copyWith(
                      color: AppColors.myWhite,
                      fontSize: getFontSize(context, 14)),
                ),
              ],
            ),
            Gap(30.h),
            // ProfileChoice(),
          ],
        ),
      ),
    );
  }
}
