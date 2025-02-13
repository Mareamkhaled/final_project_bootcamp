import 'package:flutter/material.dart';

import '../../../../core/resources/app_colors.dart';


class ClothesView extends StatelessWidget {
  const ClothesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          
        }, icon: Icon(Icons.arrow_back_ios)),
        title: Text("Clothes"),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search here',
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.myBlue,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.myBlue),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.myBlue),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            SizedBox(width: 10),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings_input_component_outlined,
                color: AppColors.myBlue,
              ),
              iconSize: 30,
              style: ButtonStyle(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
                side: WidgetStateProperty.all(BorderSide(
                  color: AppColors.myBlue,
                )),
              ),
            ),
          ],
        ),
      ),
      
    );
    
  }
}