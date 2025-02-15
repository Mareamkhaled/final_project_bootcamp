import 'package:final_project_bootcamp/core/resources/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_images.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
                            radius: 70,
                            backgroundImage:
                            AssetImage(Assets.assetsImagestojiPng),
                          
                                // NetworkImage(state.userModel.profilePic),
                          ),
                          Text(
                            AppStrings.name,
                            // state.userModel.name,
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                           AppStrings.email,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
  }
}