// import 'package:final_project_bootcamp/core/app_colors.dart';
// import 'package:final_project_bootcamp/core/app_images.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';


class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.myBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child:Icon(Icons.settings),
      ),
    );
  }
}
