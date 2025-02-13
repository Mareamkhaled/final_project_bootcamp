import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:final_project_bootcamp/helper/get_font_size.dart';
import 'package:flutter/material.dart';

import '../../../core/app_images.dart' show Assets;
import '../../../core/app_styles.dart';
import '../widgets/notification_card.dart' show NotificationCard;
import '../widgets/section_header.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Notifications',
            style: AppStyles.semiBold.copyWith(
              fontSize: getFontSize(context, 18),
              color: AppColors.myBlack,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SectionHeader(title: 'Today', markTitle: 'Mark all as read'),
            NotificationCard(
              profileImage: Assets.assetsImagesAvatar,
              actionText:
                  'Your account password has been changed successfully. ',
              timeAgo: '5 min ago',
            ),
            NotificationCard(
              profileImage: Assets.assetsImagesAvatar,
              actionText:
                  'Your account password has been changed successfully. ',
              timeAgo: '5 min ago',
            ),
            NotificationCard(
              profileImage: Assets.assetsImagesAvatar,
              actionText:
                  'Your account password has been changed successfully. ',
              timeAgo: '5 min ago',
            ),
            NotificationCard(
              profileImage: Assets.assetsImagesAvatar,
              actionText:
                  'Your account password has been changed successfully. ',
              timeAgo: '5 min ago',
            ),
            NotificationCard(
              profileImage: Assets.assetsImagesAvatar,
              actionText:
                  'Your account password has been changed successfully. ',
              timeAgo: '5 min ago',
            ),
            NotificationCard(
              profileImage: Assets.assetsImagesAvatar,
              actionText:
                  'Your account password has been changed successfully. ',
              timeAgo: '5 min ago',
            ),
            NotificationCard(
              profileImage: Assets.assetsImagesAvatar,
              actionText:
                  'Your account password has been changed successfully. ',
              timeAgo: '5 min ago',
            ),
          ],
        ),
      ),
    );
  }
}
