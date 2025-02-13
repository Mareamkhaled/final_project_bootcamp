import 'package:final_project_bootcamp/main%20screen/presentation/widgets/bannar_sale_card.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/location_section_with_notification_button.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/search_and_filter_button.dart';
import 'package:flutter/material.dart';

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
          SizedBox(
            height: 15,
          ),
          SearchAndFilterButton(),
          SizedBox(
            height: 20,
          ),
          BannarSaleCard(),
          // here
        ],
      ),
    );
  }
}
