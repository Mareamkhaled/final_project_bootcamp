import 'package:final_project_bootcamp/main%20screen/presentation/widgets/filter_button.dart';
import 'package:final_project_bootcamp/main%20screen/presentation/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class SearchAndFilterButton extends StatelessWidget {
  const SearchAndFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: MyTextFormField(
            hintText: "Search",
            prefixIcon: Icon(
              Icons.search,
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        FilterButton()
      ],
    );
  }
}
