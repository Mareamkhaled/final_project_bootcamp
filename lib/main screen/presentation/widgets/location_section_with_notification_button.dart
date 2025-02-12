import 'package:final_project_bootcamp/main%20screen/presentation/widgets/location_text_with_current_locatoin.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/notification_button.dart';
import 'package:flutter/material.dart';

class LocationSectionWithNotificationButton extends StatelessWidget {
  const LocationSectionWithNotificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LocationTextWithCurrentLocatoin(
          location: "Egypt, Cairo",
        ),
        Spacer(),
        NotificationButton()
      ],
    );
  }
}
