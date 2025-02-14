import 'package:final_project_bootcamp/features/home/presentation/widgets/new_price_and_the_old.dart';
import 'package:final_project_bootcamp/features/home/presentation/widgets/rating_section.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/get_font_size.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_style.dart';

class ProductNameWithPriceAndRate extends StatelessWidget {
  const ProductNameWithPriceAndRate({
    super.key,
    required this.nameProduct,
    required this.newPrice,
    required this.oldPrice,
  });

  final String nameProduct;
  final String newPrice;
  final String oldPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nameProduct,
          style: AppStyles.semiBold.copyWith(
            color: AppColors.myBlack,
            fontSize: getFontSize(context, 10),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            NewPriceAndTheOld(
              newPrice: newPrice,
              oldPrice: oldPrice,
            ),
            Spacer(),
            RatingSection()
          ],
        ),
      ],
    );
  }
}
