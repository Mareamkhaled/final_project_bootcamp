import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../resources/app_colors.dart';
import '../resources/app_style.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.text,
      required this.hintText,
      this.controller,
      this.validator,
      this.onChanged,
      this.inputFormatters,
      this.isObscureText = false, required this.prefixIcon, this.suffixIcon, this.obscure});

  final String text;
  final String hintText;
  // final Widget prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool isObscureText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool? obscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,
            style: AppStyles.semiBold14(context)
                .copyWith(color: AppColors.myBlack)),
        Gap(15.h),
        TextFormField(
          obscureText: isObscureText,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            // focusColor: AppColors.myWhite,
            // hoverColor: AppColors.myGrey,
            // errorStyle: ,
            fillColor: AppColors.myWhite,
            filled: true,
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.myGrey),borderRadius: BorderRadius.circular(10)),
             prefixIcon: prefixIcon,
             suffixIcon: obscure == true ? null :  suffixIcon,
               
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: hintText,
            hintStyle: AppStyles.regular12(context).copyWith(
                color: AppColors.myGrey, )
              // hintStyle: AppStyle.fontPoppinsRegular14Grey
              ),
        ),
      ],
    );
  }
}
