import 'package:final_project_bootcamp/core/Routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_images.dart';
import '../../../core/resources/app_strings.dart';
import '../widgets/onboarding_item.dart';

// ignore: must_be_immutable
class OnboardingView extends HookWidget {
  OnboardingView({super.key});
  bool? isVisibleOne;
  bool? isVisibleTwo;

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                OnBoardingItem(
                  onPressedOne: () {
                    
                  },
                  onPressedTwo: () {
                    pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                  isVisibleOne: false,
                  image: Assets.assetsImagesOnboarding1gif,
                  title: AppStrings.onBoardingOneText,
                  description: AppStrings.onBoardingOneDesc,
                  isVisibleTwo: true,
                ),
                OnBoardingItem(
                   onPressedOne: () {
                    pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                    
                  },
                  onPressedTwo: () {
                    pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                    
                  },
                  image: Assets.assetsImagesOnboarding2gif,
                  title: AppStrings.onBoardingTwoText,
                  description: AppStrings.onBoardingTwoDesc,
                  isVisibleOne: true,
                  isVisibleTwo: true,
                ),
                OnBoardingItem(
                   onPressedOne: () {
                    pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                    
                  },
                  onPressedTwo: () {
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                  image: Assets.assetsImagesOnboarding3gif,
                  title: AppStrings.onBoardingThreeText,
                  description: AppStrings.onBoardingThreeDesc,
                  isVisibleOne: true,
                  isVisibleTwo: true,
                ),
              ],
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              axisDirection: Axis.horizontal,
              effect: WormEffect(
                spacing: 6,
                radius: 10.0,
                dotWidth: 20.h,
                dotHeight: 20.h,
                strokeWidth: 10,
                dotColor: AppColors.myGrey,
                activeDotColor: AppColors.myBlue,
              ),
            ),
          ),
          Gap(20.h)
         ],
      ),
    );
  }
}