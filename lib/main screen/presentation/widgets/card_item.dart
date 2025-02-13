import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:final_project_bootcamp/core/app_styles.dart';
import 'package:final_project_bootcamp/helper/get_font_size.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/aadd_to_cart_button.dart'
    show MyButton;
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/custom_image_card.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/product_name_with_price_and_rate.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.newPrice,
    required this.oldPrice,
    required this.nameProduct,
    required this.image,
  });
  final double newPrice;
  final double oldPrice;
  final String nameProduct;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.myWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.myBlack.withOpacity(0.25),
            offset: Offset(0, 0),
            blurRadius: 4,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            CustomImageCard(
              image: image,
            ),
            SizedBox(
              height: 5,
            ),
            ProductNameWithPriceAndRate(
              nameProduct: nameProduct,
              newPrice: newPrice,
              oldPrice: oldPrice,
            ),
            SizedBox(
              height: 5,
            ),
            MyButton(
              onTap: () {},
              color: AppColors.myBlue,
              text: "Add To Cart",
              style: AppStyles.semiBold.copyWith(
                color: AppColors.myWhite,
                fontSize: getFontSize(context, 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
