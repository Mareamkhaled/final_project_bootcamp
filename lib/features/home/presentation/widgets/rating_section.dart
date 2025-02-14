// import 'package:final_project_bootcamp/core/app_styles.dart';
// import 'package:final_project_bootcamp/helper/get_font_size.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/get_font_size.dart';
import '../../../../core/resources/app_style.dart';


class RatingSection extends StatelessWidget {
  const RatingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amberAccent,
          size: 18,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          "4.5",
          style: AppStyles.semiBold.copyWith(
            color: Colors.amberAccent,
            fontSize: getFontSize(context, 10),
          ),
        )
      ],
    );
  }
}
