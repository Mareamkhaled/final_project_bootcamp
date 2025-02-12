import 'package:flutter/material.dart';
import '../../../core/resources/app_images.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
            alignment: Alignment.center,
            child: Image.asset(Assets.assetsImagesLogoPng)),
      ],
    );
  }
}
