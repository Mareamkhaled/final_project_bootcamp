import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:final_project_bootcamp/core/app_images.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/bannar_sale_content.dart';
import 'package:flutter/material.dart';

class BannarSaleCard extends StatelessWidget {
  const BannarSaleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.22,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.assetsImagesTest,
          ),
          fit: BoxFit.cover,
        ),
        color: AppColors.myBlue,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.22,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.myBlue.withOpacity(0.5),
              AppColors.myWhite.withOpacity(0),
              AppColors.myBlue.withOpacity(0.5),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: BannarSaleContent(),
      ),
    );
  }
}
