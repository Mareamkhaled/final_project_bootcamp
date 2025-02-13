import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:final_project_bootcamp/core/app_images.dart';
import 'package:final_project_bootcamp/core/app_styles.dart';
import 'package:final_project_bootcamp/helper/get_font_size.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';

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
                  categoryName: 'data',
                  categoryImage: Assets.assetsImagesTest,
                ),
                CategoryCard(
                  categoryName: 'data',
                  categoryImage: Assets.assetsImagesTest,
                ),
                CategoryCard(
                  categoryName: 'data',
                  categoryImage: Assets.assetsImagesTest,
                ),
                CategoryCard(
                  categoryName: 'data',
                  categoryImage: Assets.assetsImagesTest,
                ),
                CategoryCard(
                  categoryName: 'data',
                  categoryImage: Assets.assetsImagesTest,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
