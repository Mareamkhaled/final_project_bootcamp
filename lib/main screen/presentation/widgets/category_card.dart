import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 2, bottom: 2, left: 2),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.myBlack.withOpacity(0.25),
              offset: Offset(0, 0),
              blurRadius: 4,
            )
          ],
          color: AppColors.myWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.abc),
            SizedBox(
              width: 5,
            ),
            Text("data")
          ],
        ),
      ),
    );
  }
}
