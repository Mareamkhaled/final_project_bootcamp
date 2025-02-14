
import 'package:final_project_bootcamp/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_style.dart';
import '../widgets/categories_section.dart';
import '../widgets/custom_grid_view.dart';
import '../widgets/upper_content.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigation(),
      backgroundColor: AppColors.myWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            UpperContent(),
            SizedBox(
              height: 15,
            ),
            CategoriesSection(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Most Popular",
                    style: AppStyles.semiBold.copyWith(
                      color: AppColors.myBlack,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 15),
                  CustomGridView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
