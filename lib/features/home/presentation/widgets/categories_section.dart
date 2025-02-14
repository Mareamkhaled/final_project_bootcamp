import 'package:final_project_bootcamp/features/home/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/get_font_size.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_images.dart';
import '../../../../core/resources/app_style.dart';


class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Categories",
            style: AppStyles.semiBold.copyWith(
              color: AppColors.myBlack,
              fontSize: getFontSize(context, 16),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryCard(
                  categoryName: 'Electronics',
                  categoryImage: Assets.assetsImagesOne,
                ),
                CategoryCard(
                  categoryName: 'Plumbing',
                  categoryImage: Assets.assetsImagesTwo,
                ),
                CategoryCard(
                  categoryName: 'Clothes',
                  categoryImage: Assets.assetsImagesThree,
                ),
                CategoryCard(
                  categoryName: 'Sports',
                  categoryImage: Assets.assetsImagesFour,
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
