import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_style.dart';

class NotificationTextWithTimeAgo extends StatelessWidget {
  const NotificationTextWithTimeAgo({
    super.key,
    required this.actionText,
    required this.timeAgo,
  });

  final String actionText;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.68,
          child: Text(
            actionText,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: AppStyles.semiBold.copyWith(
              color: AppColors.myBlack,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          timeAgo,
          style:
              AppStyles.semiBold.copyWith(color: AppColors.myGrey, fontSize: 8),
        ),
      ],
    );
  }
}
