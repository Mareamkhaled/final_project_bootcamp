import 'package:final_project_bootcamp/notification/presentation/widgets/notification_card_content.dart'
    show NotificationCardContent;
import 'package:final_project_bootcamp/notification/presentation/widgets/notification_card_style.dart'
    show NotificationCardStyle;
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String profileImage;
  final String actionText;
  final String timeAgo;

  const NotificationCard({
    required this.profileImage,
    required this.actionText,
    required this.timeAgo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationCardStyle(
      widget: NotificationCardContent(
        profileImage: profileImage,
        actionText: actionText,
        timeAgo: timeAgo,
      ),
    );
  }
}
