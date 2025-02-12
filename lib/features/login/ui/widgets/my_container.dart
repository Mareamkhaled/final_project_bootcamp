import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_colors.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      shadowColor: AppColors.myGrey,
      borderRadius: BorderRadius.circular(30.r),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.myWhite),
          child: Center(
            child: Image.asset(
              img,
              height: 50.h,
              width: 50.w,
            ),
          ),
        ),
      ),
    );
  }
}
