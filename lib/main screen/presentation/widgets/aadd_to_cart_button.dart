import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.onTap,
      required this.color,
      required this.text,
      required this.style});
  final void Function() onTap;
  final Color color;
  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        // height: 80.h,
        decoration: BoxDecoration(
            // border: Border.all(color: AppColors.myBlue, width: 2),
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
