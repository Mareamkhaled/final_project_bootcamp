import 'package:final_project_bootcamp/core/resources/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/Routing/routes.dart';
import '../../../../core/helpers/get_font_size.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_style.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                         AppStrings.dontHaveAnAccount,
                        style: AppStyles.semiBold
                            .copyWith(color: AppColors.myGrey, fontSize: getFontSize(context, 12)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.register);
                        },
                        child: Text(AppStrings.registerNow,
                            style: AppStyles.semiBold
                                .copyWith(color: AppColors.myBlue, fontSize: getFontSize(context, 12))),
                      ),
                    ],
                  );
  }
}