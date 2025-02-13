import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // height: 100.h,
        // width: 100.w,
        decoration: BoxDecoration(

          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 0),
              blurRadius: 4,

            )
          ],
            borderRadius: BorderRadius.circular(10),
            color: AppColors.myWhite),
        child: Center(
          child: Image.asset(
            img,
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }
}
