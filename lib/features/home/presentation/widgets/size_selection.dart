import 'package:flutter/material.dart';

class SizeSelection extends StatefulWidget {
  const SizeSelection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SizeSelectionState createState() => _SizeSelectionState();
}

class _SizeSelectionState extends State<SizeSelection> {
  String selectedSize = 'L'; // Default selected size

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ['M', 'L', 'XL', 'XXL', 'XXXL'].map((size) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = size;
            });
          },
          child: Container(
            margin: EdgeInsets.all(4.0),
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 16.0),
            decoration: BoxDecoration(
              color: selectedSize == size ? Colors.teal : Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.teal),
            ),
            child: Text(
              size,
              style: TextStyle(
                color: selectedSize == size ? Colors.white : Colors.teal,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}