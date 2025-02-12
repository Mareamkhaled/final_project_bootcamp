import 'package:final_project_bootcamp/core/app_colors.dart';
import 'package:final_project_bootcamp/core/app_styles.dart';
import 'package:final_project_bootcamp/helper/get_font_size.dart';
import 'package:flutter/material.dart';

class LocationTextWithCurrentLocatoin extends StatelessWidget {
  const LocationTextWithCurrentLocatoin({
    super.key,
    required this.location,
  });
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: AppStyles.regular.copyWith(
            color: AppColors.myGrey,
            fontSize: getFontSize(context, 10),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on_sharp,
              size: 16,
              color: AppColors.myBlue,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              location,
              style: AppStyles.semiBold14(context).copyWith(
                color: AppColors.myBlue,
              ),
            )
          ],
        )
      ],
    );
  }
}
