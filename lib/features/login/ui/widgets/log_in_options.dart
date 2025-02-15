import 'package:final_project_bootcamp/features/login/ui/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/get_font_size.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_images.dart';
import '../../../../core/resources/app_style.dart';

class LogInOptions extends StatelessWidget {
  const LogInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Align(
                    alignment: Alignment.center,
                    child: Text(
                      "or continue with ",
                      style: AppStyles.semiBold
                          .copyWith(color: AppColors.myGrey, fontSize: getFontSize(context, 12)),
                    ),
                  ),
                  Gap(15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyContainer(img: Assets.assetsImagesGooglePng),
                      MyContainer(img: Assets.assetsImagesApplePng),
                      MyContainer(img: Assets.assetsImagesFaceBookPng)
                    ],
                  ),
      ],
    );
  }
}