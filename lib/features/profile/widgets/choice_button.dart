import 'package:flutter/material.dart';
class ChoiceButton extends StatelessWidget {
  const ChoiceButton({super.key, required this.onTap, required this.color, required this.text, required this.style, this.border});
  final void Function() onTap;
  final Color color;
  final String text;
  final TextStyle style;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 35,vertical: 15),
        
        // height: 60.h,
        decoration: BoxDecoration(
          border: border,
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
