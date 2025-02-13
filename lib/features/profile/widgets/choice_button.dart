import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/app_colors.dart';
class ChoiceButton extends StatelessWidget {
  const ChoiceButton({super.key, required this.onTap, required this.color, required this.text, required this.style});
  final void Function() onTap;
  final Color color;
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 120.w,
        height: 60.h,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.myBlue, width: 2),
            borderRadius: BorderRadius.circular(10),
            color: color),
        child: Center(
          child: Text(
            text,
            style: style,
          ),
        ),
      ),
    );
  }
}
