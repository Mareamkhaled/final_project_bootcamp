import 'package:final_project_bootcamp/core/resources/app_images.dart';
import 'package:final_project_bootcamp/features/home/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
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
        child: Column(children: [
          Image.asset(Assets.assetsImagesApplePng,height: 100,width: 150,),
          CustomText(
            'Clothes',color: Colors.black,
            ),
        ],),
      ),
    );
  }
}