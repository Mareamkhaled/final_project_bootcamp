import 'package:dio/dio.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/card_item.dart';
import 'package:flutter/material.dart';

import '../../data/services/clothes_service.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({
    super.key,
  });

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  late Future<List<ProductItem>> products;

  @override
  void initState() {
    super.initState();
    products = ProductApi(Dio()).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductItem>>(
      future: products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final items = snapshot.data!;

          if (items.isEmpty) {
            return const Center(child: Text('No products available'));
          }

          return SizedBox(
            height: 1800,
            child: GridView.builder(
              padding: EdgeInsets.all(5),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                mainAxisExtent: 250,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) => CardItem(
                nameProduct: items[index].title ?? 'No Title',
                newPrice: '${items[index].price}',
                image: items[index].imagePath ?? 'assets/images/clothes.png',
                oldPrice: '1000',
              ),
            ),
          );
        } else {
          return const Center(child: Text('No products found'));
        }
      },
    );
  }
}
