import 'package:final_project_bootcamp/core/Routing/routes.dart';
import 'package:final_project_bootcamp/core/resources/app_images.dart';
import 'package:final_project_bootcamp/features/home/presentation/widgets/aadd_to_cart_button.dart';
import 'package:final_project_bootcamp/features/home/presentation/widgets/new_price_and_the_old.dart';
import 'package:final_project_bootcamp/features/home/presentation/widgets/rating_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_style.dart';
// import '../../../../core/widgets/my_button.dart';
import '../../data/models/clothes_model.dart';

class ProductItemm extends StatelessWidget {
  final ProductItem product;
  const ProductItemm({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: const EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.myBlack.withOpacity(0.25),
          offset: const Offset(0, 0),
          blurRadius: 4,
        )
      ], color: AppColors.myWhite, borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, Routes.detailProducts,
            arguments: product),
        child: Container(
          decoration: BoxDecoration(),
          child: GridTile(
            //! Hero
            footer: Hero(
              tag: product.id!,
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  color: AppColors.myWhite,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(product.title!,
                            style: AppStyles.semiBold.copyWith(
                                color: AppColors.myBlack, fontSize: 10)),
                      ),
                      Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NewPriceAndTheOld(
                            newPrice: "300",
                            oldPrice: "500",
                          ),
                          RatingSection()
                        ],
                      ),
                      Gap(5),
                      MyButton(
                          onTap: () {},
                          color: AppColors.myBlue,
                          text: "Add To Cart",
                          style: AppStyles.semiBold
                              .copyWith(color: AppColors.myWhite, fontSize: 8))
                    ],
                  )),
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                // color: AppColors.myWhite,
                child: product.imagePath!.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        width: double.infinity,
                        height: double.infinity,
                        placeholder: Assets.assetsImagesGif,
                        image: product.imagePath!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset("assets/images/logo.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
