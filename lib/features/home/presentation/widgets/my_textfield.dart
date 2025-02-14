import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/helpers/get_font_size.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_style.dart';


class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.hintText,
      this.controller,
      this.validator,
      this.onChanged,
      this.inputFormatters,
      this.isObscureText = false,
      required this.prefixIcon,
      this.suffixIcon,
      this.obscure});
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
    return TextFormField(
      obscureText: isObscureText,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        fillColor: AppColors.myWhite,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.myGrey),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        prefixIconColor: AppColors.myGrey,
        prefixIcon: prefixIcon,
        suffixIcon: obscure == true ? null : suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hintText,
        hintStyle: AppStyles.regular.copyWith(
          color: AppColors.myGrey,
          fontSize: getFontSize(context, 12)
        ),
      ),
    );
  }
}
