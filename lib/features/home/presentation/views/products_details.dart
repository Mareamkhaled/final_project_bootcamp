
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_style.dart';
// import '../../../../core/widgets/my_button.dart';
import '../../data/models/clothes_model.dart';
import '../widgets/aadd_to_cart_button.dart';
import '../widgets/rating_section.dart';
import '../widgets/size_selection.dart';

class ProductsDetails extends StatelessWidget {
  final ProductItem product;
  const ProductsDetails({super.key, required this.product});

  Widget buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height * 0.4,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.myWhite,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
            tag: product.id!,
            child: Image.network(
              product.imagePath!,
              fit: BoxFit.cover,
            )),
      ),
   
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
            text: title,
            style: const TextStyle(
                color: AppColors.myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        TextSpan(
            text: value,
            style: const TextStyle(
                color: AppColors.myWhite,
                fontWeight: FontWeight.bold,
                fontSize: 18))
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      endIndent: endIndent,
      height: 30,
      color: AppColors.myBlue,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: AppColors.myWhite,
      body: CustomScrollView(
        slivers: [
        
          buildSliverAppBar(context),
        
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.title!,
                              style: AppStyles.semiBold.copyWith(
                                color: AppColors.myBlack,
                                fontSize: 16,
                              )),
                          RatingSection()
                        ],
                      ),
                      Gap(10),
                      Text(product.description!,
                          style: AppStyles.regular
                              .copyWith(fontSize: 10, color: AppColors.myGrey)),
                      Gap(20),
                      Text(
                        "Overview",
                        style: AppStyles.semiBold
                            .copyWith(color: AppColors.myBlue, fontSize: 15),
                      ),
                      Gap(5),
                      Text(
                        "Experience the excellence of this product, designed with quality and style. Whether you're after the latest trends, innovative tech, or unique home decor, this product offers durability and aesthetic appeal. Elevate your lifestyle with [Product Name] and enjoy unmatched performance and value.",
                        style: AppStyles.regular
                            .copyWith(color: AppColors.myGrey, fontSize: 10),
                      ),
                      Gap(20),
                      Text(
                        "Sizes",
                        style: AppStyles.semiBold
                            .copyWith(color: AppColors.myBlue, fontSize: 15),
                      ),
                      Gap(10),
                      SizedBox(
                        height: 40,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizeSelection()),
                      )
                      
                      ,Gap(100),
                     
                     
                    ],
                  ),
                ),
             
                const SizedBox(
                  height: 400,
                )
              ],
            ),
          )
        ],
      ),
       bottomNavigationBar: BottomAppBar(
        color: AppColors.myWhite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price", style: AppStyles.regular.copyWith(color: AppColors.myGrey, fontSize: 12)),
                      Text("\$${product.price}", style: AppStyles.bold.copyWith(color: AppColors.myBlue, fontSize: 15)),
                    ],
                  ),
                ),
                Spacer(),
                Expanded(
                  child: MyButton(
                    color: AppColors.myBlue, 
                    onTap: () {}, 
                    text: 'Add to Cart', 
                    style: AppStyles.semiBold.copyWith(color: AppColors.myWhite, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
