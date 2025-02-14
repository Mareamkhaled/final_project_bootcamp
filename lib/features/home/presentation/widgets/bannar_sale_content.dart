// import 'package:final_project_bootcamp/core/app_colors.dart';
// import 'package:final_project_bootcamp/core/app_styles.dart';
// import 'package:final_project_bootcamp/main%20screen/presentation/widgets/shop_now_button.dart';
import 'package:final_project_bootcamp/features/home/presentation/widgets/shop_now_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_style.dart';

class BannarSaleContent extends StatelessWidget {
  const BannarSaleContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Elevate Your Style",
            style: AppStyles.semiBold.copyWith(
              color: AppColors.myBink,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            textAlign: TextAlign.center,
            "Discover the Latest Trends in Accessories to Complete Your Look",
            style: AppStyles.regular.copyWith(
              color: AppColors.myBink,
              fontSize: 8,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          ShopNowButton()
        ],
      ),
    );
  }
}
