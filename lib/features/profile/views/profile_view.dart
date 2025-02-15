import 'package:final_project_bootcamp/core/resources/app_colors.dart';
import 'package:final_project_bootcamp/core/resources/app_style.dart';
import 'package:final_project_bootcamp/features/login/logic/cubit/login_cubit.dart';
import 'package:final_project_bootcamp/features/profile/views/profile_view_default.dart';
import 'package:final_project_bootcamp/features/profile/widgets/choice_button.dart';
import 'package:final_project_bootcamp/features/profile/widgets/contact_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/helpers/get_font_size.dart';

class ProfileScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is GetUserFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMsg),
          ));
        }
      },
      builder: (context, state) {
        if (state is GetUserLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is GetUserSuccess) {
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
                  onPressed: () {
                    // Edit profile action
                  },
                ),
              ],
              backgroundColor: AppColors.myBlue,
              title: Text('Profile',
                  style: AppStyles.semiBold.copyWith(
                      color: AppColors.myBlack,
                      fontSize: getFontSize(context, 16))),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: AppColors.myBlue,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              NetworkImage(state.userModel.profilePic),
                        ),
                        Text(
                          state.userModel.name,
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          state.userModel.email,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ContactTextField(
                  hintText: "mariam",
                  controller: nameController,
                  icon: Icons.person,
                  label: 'Name',
                ),
                ContactTextField(
                  hintText: "maream@gmail.com",
                  controller: emailController,
                  icon: Icons.email,
                  label: 'Email',
                ),
                ContactTextField(
                  hintText: "Italia",
                  controller: locationController,
                  icon: Icons.location_on,
                  label: 'Location',
                ),
                ContactTextField(
                  hintText: "+20123456789",
                  controller: phoneController,
                  icon: Icons.phone,
                  label: 'Mobile Phone',
                ),
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceButton(
                      onTap: () {},
                      color: AppColors.myWhite,
                      text: "Cancel",
                      style: AppStyles.semiBold.copyWith(
                          color: AppColors.myRed,
                          fontSize: getFontSize(context, 14)),
                    ),
                    Gap(40.w),
                    ChoiceButton(
                      onTap: () {},
                      color: AppColors.myBlue,
                      text: "Save",
                      style: AppStyles.semiBold.copyWith(
                          color: AppColors.myWhite,
                          fontSize: getFontSize(context, 14)),
                    ),
                  ],
                )
              ],
            ),
          );
        } else {
          return ProfileScreenDefault();
        }
      },
    );
  }
}
