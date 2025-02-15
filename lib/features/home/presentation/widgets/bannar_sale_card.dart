import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project_bootcamp/core/helpers/get_font_size.dart';
import 'package:final_project_bootcamp/core/resources/app_images.dart';
import 'package:final_project_bootcamp/core/resources/app_style.dart';
import 'package:final_project_bootcamp/features/profile/widgets/choice_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/resources/app_colors.dart';

class CarouselSliderExample extends StatefulWidget {
  const CarouselSliderExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CarouselSliderExampleState createState() => _CarouselSliderExampleState();
}

class _CarouselSliderExampleState extends State<CarouselSliderExample> {
  final List<String> imgList = [
    Assets.assetsImagesFrameOne,
    Assets.assetsImagesFrameTwo,
    Assets.assetsImagesFrameThree,
  ];

  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList.map((item) => Stack(
            children: [
              Center(
                child: Image.asset(item, fit: BoxFit.cover, width: 1000),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(10),
                    Text(
                      "Elevate Your Style",
                      style: AppStyles.semiBold.copyWith(
                        fontSize: getFontSize(context, 14),
                        color: AppColors.myYellow,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.green,
                            offset: Offset(2.0, 2.0),
                          )
                        ],
                      ),
                    ),
                    Gap(10),
                    Text(
                      "Discover the Latest Trends in Accessories \n to Complete Your Look",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.pink, // Replace with AppColors.myBink
                        fontSize: 8,
                      ),
                    ),
                    Gap(10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: ChoiceButton(
                        onTap: () {},
                        color: AppColors.myYellow,
                        text: "Shop now",
                        style: AppStyles.semiBold.copyWith(
                          fontSize: getFontSize(context, 10),
                          color: AppColors.myBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: AppColors.myBlue
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? AppColors.myWhite
                      // ignore: deprecated_member_use
                      : AppColors.myBlue).withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
