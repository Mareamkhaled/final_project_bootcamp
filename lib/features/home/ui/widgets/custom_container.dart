import 'package:final_project_bootcamp/features/home/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Row(
            children: [
                CustomText(
                  'Shop the ',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, 
                ),
                CustomText(
                   'Latest ',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myBlue, 
                  ),
            ],
          ),
                  Row(
                    children: [
                      CustomText(
                    'Fashion',fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.myBlue, ),
                    CustomText(
                      ' Stylish,',
                      fontSize: 16,
                       fontWeight: FontWeight.bold,
                    ),
                    ],
                  ),
                   CustomText(
                      'Comfortable, and \nPerfectly You',
                      fontSize: 16,
                       fontWeight: FontWeight.bold,
                    ),
              ],
            ),
            Image(
              height: 100,
              width: 100,
              image: NetworkImage('https://i.pinimg.com/1200x/57/30/f2/5730f2f9ac4e7e6d87a62a094ba86ae7.jpg')),
          ],
        ),
      ),
    );
  }
}