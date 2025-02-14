import 'package:flutter/material.dart';

import '../../../../core/helpers/get_font_size.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_style.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryName,
    required this.categoryImage,
  });
  final String categoryName;
  final String categoryImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 2, bottom: 2, left: 2),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: AppColors.myBlack.withOpacity(0.25),
              offset: Offset(0, 0),
              blurRadius: 4,
            )
          ],
          color: AppColors.myWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image(
              image: AssetImage(categoryImage),
              height: 30,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              categoryName,
              style: AppStyles.semiBold.copyWith(
                color: AppColors.myBlack,
                fontSize: getFontSize(context, 10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
