// import 'package:final_project_bootcamp/main%20screen/presentation/widgets/bannar_sale_card.dart';
// import 'package:final_project_bootcamp/main%20screen/presentation/widgets/location_section_with_notification_button.dart';
// import 'package:final_project_bootcamp/main%20screen/presentation/widgets/search_and_filter_button.dart';
import 'package:final_project_bootcamp/features/home/presentation/widgets/bannar_sale_card.dart';
import 'package:final_project_bootcamp/features/home/presentation/widgets/location_section_with_notification_button.dart';
import 'package:final_project_bootcamp/features/home/presentation/widgets/search_and_filter_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class UpperContent extends StatelessWidget {
  const UpperContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          LocationSectionWithNotificationButton(),
          Gap(30),
          SearchAndFilterButton(),
          // Gap(30),
          CarouselSliderExample(),
          // here
        ],
      ),
    );
  }
}
