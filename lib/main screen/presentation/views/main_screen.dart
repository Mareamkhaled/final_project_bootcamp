import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/location_section_with_notification_button.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/search_and_filter_button.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            LocationSectionWithNotificationButton(),
            SizedBox(
              height: 15,
            ),
            SearchAndFilterButton(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
