import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  // Regular font weight
  static final regular = GoogleFonts.lemonada(
    fontWeight: FontWeight.w400,
  );

  // Light font weight
  static final light = GoogleFonts.lemonada(
    fontWeight: FontWeight.w300,
  );
 // SemiBold font weight
  static final semiBold = GoogleFonts.lemonada(
    fontWeight: FontWeight.w600,
  );

  // Bold font weight
  static final bold = GoogleFonts.lemonada(
    fontWeight: FontWeight.w700,
  );
  
  // TextStyle for font size 12
  static TextStyle regular12(BuildContext context) => regular.copyWith(
        fontSize: 12.sp,
        // color: AppColors.myBlack,
      );
  static TextStyle regular114(BuildContext context) => regular.copyWith(
        fontSize: 14.sp,
        // color: AppColors.myBlack,
      );
  static TextStyle regular16 (BuildContext context) => regular.copyWith(
      fontSize: 16.sp,
      // color: AppColors.myGrey,
    );
    

// TextStyle for font size 24 with light font weight
static TextStyle light24(BuildContext context) => light.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: 24.sp,
      // color: const Color(0xFF000000),
    );


// TextStyle for font size 24 with semiBold font weight
static TextStyle semiBold14(BuildContext context) => semiBold.copyWith(
      fontSize: 14.sp,
      // color: AppColors.myGrey,
    );
static TextStyle semiBold14White(BuildContext context) => semiBold.copyWith(
      fontSize: 14.sp,
      // color: AppColors.myWhite,
    );
static TextStyle semiBold12(BuildContext context) => semiBold.copyWith(
      fontSize: 12.sp,
      // color: AppColors.myGrey,
    );
static TextStyle semiBold12Blue(BuildContext context) => semiBold.copyWith(
      fontSize: 12.sp,
      // color: AppColors.myBlue,
    );
static TextStyle semiBold16(BuildContext context) => semiBold.copyWith(
      fontSize: 16.sp,
      // color: AppColors.myGrey,
    );

// TextStyle for font size 24 with bold font weight
static TextStyle bold28(BuildContext context) => bold.copyWith(
      fontSize: 28.sp,
      // color: AppColors.myBlue,
    );
static TextStyle bold24(BuildContext context) => bold.copyWith(
      fontSize: 24.sp,
      // color: AppColors.myBlack,
    );


  // TextStyle for font size 28
  
}


// double getFontSize(BuildContext context, double baseSize) {
//   double screenWidth = MediaQuery.of(context).size.width;
//   return baseSize * (screenWidth / 375); 
// }
