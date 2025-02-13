import 'package:final_project_bootcamp/notification/presentation/widgets/notification_text_with_time_ago.dart'
    show NotificationTextWithTimeAgo;
import 'package:flutter/material.dart';

class NotificationCardContent extends StatelessWidget {
  const NotificationCardContent({
    super.key,
    required this.profileImage,
    required this.actionText,
    required this.timeAgo,
  });

  final String profileImage;
  final String actionText;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profileImage),
                radius: 25,
              ),
              const SizedBox(
                width: 15,
              ),
              NotificationTextWithTimeAgo(
                actionText: actionText,
                timeAgo: timeAgo,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
