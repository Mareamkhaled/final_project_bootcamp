import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.myBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.filter_list,
          size: 30,
          color: AppColors.myWhite,
        ),
      ),
    );
  }
}
