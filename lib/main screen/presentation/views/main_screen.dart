import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/categories_section.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/custom_grid_view.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/upper_content.dart';
import 'package:flutter/material.dart';

import '../../../core/app_styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.myWhite,
        selectedItemColor: AppColors.myBlue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
                  SizedBox(
                    height: 15,
                  ),
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
