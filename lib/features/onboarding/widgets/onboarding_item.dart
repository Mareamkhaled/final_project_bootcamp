import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gif_view/gif_view.dart';
import '../../../core/helpers/get_font_size.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_style.dart';
class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      this.isVisibleOne = false,
      this.isVisibleTwo = false,required this.onPressedOne,required this.onPressedTwo});
  final String image;
  final String title;
  final String description;
  final bool? isVisibleOne;
  final bool? isVisibleTwo;
  final void Function() onPressedOne;
  final void Function() onPressedTwo;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                // GifView(
                  // controller: GifController(),
                   Image(image:AssetImage(image)),
                  // image: AssetImage(image),
                // ),
                // Lottie.asset(image),
                  Text(
                    title,
                    style: AppStyles.bold
                        .copyWith(color: AppColors.myBlue, fontSize: getFontSize(context, 24)),
                    textAlign: TextAlign.center,
                  ),
                  Gap(20.h),
                  Text(
                    description,
                    style: AppStyles.regular
                        .copyWith(color: AppColors.myGrey, fontSize: getFontSize(context, 16)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: isVisibleOne!,
                  child: TextButton(
                    onPressed: onPressedOne,
                    child: Text(
                      "Back",
                      style: AppStyles.semiBold
                          .copyWith(color: AppColors.myBlue, fontSize: getFontSize(context, 16)),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisibleTwo!,
                  child: TextButton(
                    onPressed: onPressedTwo,
                    child: Text(
                      "Next",
                      style: AppStyles.semiBold
                          .copyWith(color: AppColors.myBlue, fontSize: getFontSize(context, 16)),
                    ),
                  ),
                ),
              ],
            ),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}


