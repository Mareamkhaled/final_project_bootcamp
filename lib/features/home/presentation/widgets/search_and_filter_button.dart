
import 'package:final_project_bootcamp/features/home/presentation/widgets/filter_button.dart';
import 'package:final_project_bootcamp/features/home/presentation/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

// import '../../../../core/widgets/my_text_form_field.dart';

class SearchAndFilterButton extends StatelessWidget {
  const SearchAndFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.65,
          child: MyTextFormField(

            hintText: "Search",
            prefixIcon: Icon(
              Icons.search,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.05,
        ),
        FilterButton()
      ],
    );
  }
}
