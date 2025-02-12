import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
    this.onTap,
  });
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.myGrey_1,
          boxShadow: [
            BoxShadow(
              color: AppColors.myBlack.withOpacity(0.25),
              offset: Offset(0, 0),
              blurRadius: 4,
            ),
          ],
        ),
        child: Icon(
          Icons.notifications,
          color: AppColors.myBlack,
          size: 24,
        ),
      ),
    );
  }
}
