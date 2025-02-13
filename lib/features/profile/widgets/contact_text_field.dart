import 'package:final_project_bootcamp/core/resources/app_colors.dart';
import 'package:final_project_bootcamp/core/resources/app_style.dart';
import 'package:flutter/material.dart';

class ContactTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String label;

  const ContactTextField({super.key, 
    required this.controller,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          
          icon: Icon(icon, color: AppColors.myBlue),
          labelText: label,
          labelStyle: AppStyles.semiBold16(context).copyWith(color: AppColors.myBlack)
          ,
          // border: OutlineInputBorder(),
        ),
      ),
    );
  }
}