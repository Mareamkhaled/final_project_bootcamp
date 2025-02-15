import '../../../core/resources/app_controllers.dart';
import 'contact_text_field.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/form_validate.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        ContactTextField(
          validator: FormValidator.validateName,
          hintText: "mariam",
          controller: AppControllers.nameController,
          icon: Icons.person,
          label: 'Name',
        ),
        ContactTextField(
          validator: FormValidator.validateEmail,
          hintText: "maream@gmail.com",
          controller: AppControllers.emailController,
          icon: Icons.email,
          label: 'Email',
        ),
        ContactTextField(
          hintText: "Italia",
          controller: AppControllers.locationController,
          icon: Icons.location_on,
          label: 'Location',
        ),
        ContactTextField(
          validator: FormValidator.validatePhoneNumber,
          hintText: "+20123456789",
          controller: AppControllers.phoneController,
          icon: Icons.phone,
          label: 'Mobile Phone',
        ),
      ],
    ));
  }
}
