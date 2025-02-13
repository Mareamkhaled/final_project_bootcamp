import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/category_card.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/upper_content.dart';
import 'package:flutter/material.dart';

import '../../../core/app_styles.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      body: Column(
        children: [
          UpperContent(),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories",
                  style: AppStyles.semiBold.copyWith(
                    color: AppColors.myBlack,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryCard(),
                      CategoryCard(),
                      CategoryCard(),
                      CategoryCard(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
