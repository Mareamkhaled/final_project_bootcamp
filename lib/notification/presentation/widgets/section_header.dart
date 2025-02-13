import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/app_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String markTitle;

  const SectionHeader(
      {required this.title, super.key, required this.markTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppStyles.semiBold.copyWith(
              color: AppColors.myGrey,
              fontSize: 9,
            ),
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            child: Text(
              markTitle,
              style: AppStyles.semiBold.copyWith(
                color: AppColors.myBlue,
                fontSize: 9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
