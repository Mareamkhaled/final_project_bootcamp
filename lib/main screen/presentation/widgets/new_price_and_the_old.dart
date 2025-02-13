import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:final_project_bootcamp/core/app_styles.dart';
import 'package:final_project_bootcamp/helper/get_font_size.dart';
import 'package:flutter/material.dart';

class NewPriceAndTheOld extends StatelessWidget {
  const NewPriceAndTheOld({
    super.key,
    required this.newPrice,
    required this.oldPrice,
  });
  final double newPrice;
  final double oldPrice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          r"$" + newPrice.toString(),
          style: AppStyles.semiBold.copyWith(
            color: Colors.red,
            fontSize: getFontSize(context, 12),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          r"$" + oldPrice.toString(),
          style: AppStyles.semiBold.copyWith(
            decoration: TextDecoration.lineThrough,
            color: AppColors.myGrey,
            fontSize: getFontSize(context, 10),
          ),
        ),
      ],
    );
  }
}
