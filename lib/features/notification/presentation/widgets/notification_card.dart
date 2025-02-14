import 'notification_card_style.dart';
import 'package:flutter/material.dart';
import 'notification_card_content.dart';

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
