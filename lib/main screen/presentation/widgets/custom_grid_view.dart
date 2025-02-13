import 'package:final_project_bootcamp/core/app_images.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/card_item.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: GridView.builder(
        padding: EdgeInsets.all(5),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          mainAxisExtent: 250,
        ),
        itemCount: 6,
        itemBuilder: (context, index) => CardItem(
          newPrice: 300.00,
          oldPrice: 500.00,
          nameProduct: 'Curology Product Set ',
          image: Assets.assetsImagesTest,
        ),
      ),
    );
  }
}
