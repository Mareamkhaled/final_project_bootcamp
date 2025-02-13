import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationCardStyle extends StatelessWidget {
  const NotificationCardStyle({
    super.key,
    required this.widget,
  });
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.myGray100_6,
            width: 0.5,
          ),
          top: BorderSide(
            color: AppColors.myGray100_6,
            width: 0.5,
          ),
        ),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(AppColors.myWhite),
          backgroundColor: WidgetStateProperty.all(
            Colors.transparent,
          ),
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 25,
            ),
          ),
        ),
        onPressed: () {},
        child: widget,
      ),
    );
  }
}
