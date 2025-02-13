import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:final_project_bootcamp/core/app_styles.dart';
import 'package:final_project_bootcamp/helper/get_font_size.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/new_price_and_the_old.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/rating_section.dart';
import 'package:flutter/material.dart';

class ProductNameWithPriceAndRate extends StatelessWidget {
  const ProductNameWithPriceAndRate({
    super.key,
    required this.nameProduct,
    required this.newPrice,
    required this.oldPrice,
  });

  final String nameProduct;
  final double newPrice;
  final double oldPrice;

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
