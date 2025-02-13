// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../../core/Routing/routes.dart';
// import '../../../../core/helpers/form_validate.dart';
// import '../../../../core/resources/app_colors.dart';
// import '../../../../core/resources/app_strings.dart';
// import '../../../../core/resources/app_style.dart';
// import '../../../../core/widgets/my_button.dart';
// import '../../../../core/widgets/my_text_form_field.dart';
// import '../../logic/cubit/signup_cubit.dart';
// // import '../widgets/signup_form.dart';

// class SignupViewTwo extends StatelessWidget {
//   const SignupViewTwo({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return BlocConsumer<SignupCubit, SignupState>(
//       listener: (context, state) {
//         if (state is SignUPSuccess) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(
//             state.message,
//           )));
//           Navigator.pushNamed(context, Routes.test);
//         } else if (state is SignUPFailure) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(
//             state.errorMsg,
//           )));
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//             // appBar: CustomAppBar(text: "Login"),
//             resizeToAvoidBottomInset: false,
//             body: SafeArea(
//                 child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Gap(100.h),
//                   Text(
//                     AppStrings.signUp,
//                     style: AppStyles.bold28(context)
//                         .copyWith(color: AppColors.myBlack),
//                   ),
//                   Gap(5.h),
//                   Text(
//                     AppStrings.signUpWelcome,
//                     style: AppStyles.regular12(context)
//                         .copyWith(color: AppColors.myGrey),
//                   ),
//                   // style: AppStyle.fontRegular14Grey),
//                   Gap(30.h),
//                   // SignupForm(),
//                   Align(
//                       alignment: Alignment.center,
//                       child: SizedBox(
//                           width: 130,
//                           height: 130,
//                           child: context.read<SignupCubit>().profilePic == null
//                               ? CircleAvatar(
//                                   backgroundColor:
//                                       AppColors.myBlue.withOpacity(0.2),
//                                   // backgroundImage: const AssetImage("assets/images/avatar.png"),
//                                   child: Stack(
//                                     children: [
//                                       Positioned(
//                                         bottom: 5,
//                                         right: 5,
//                                         child: GestureDetector(
//                                           onTap: () async {},
//                                           child: Container(
//                                             height: 50,
//                                             width: 50,
//                                             decoration: BoxDecoration(
//                                               color: AppColors.myBlue,
//                                               border: Border.all(
//                                                   color: Colors.white,
//                                                   width: 3),
//                                               borderRadius:
//                                                   BorderRadius.circular(25),
//                                             ),
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 ImagePicker()
//                                                     .pickImage(
//                                                         source:
//                                                             ImageSource.gallery)
//                                                     .then((value) =>
//                                                         context
//                                                             .read<SignupCubit>()
//                                                             .uploadProfilePic(
//                                                                 value!)
//                                                         );
//                                               },
//                                               child: const Icon(
//                                                 Icons.camera_alt_sharp,
//                                                 color: Colors.white,
//                                                 size: 25,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               : CircleAvatar(
//                                   backgroundImage: FileImage(File(context
//                                       .read<SignupCubit>()
//                                       .profilePic!
//                                       .path)),
//                                 ))),
//                   Form(
//                       key: BlocProvider.of<SignupCubit>(context).signUpKey,
//                       child: Column(
//                     children: [
//                       MyTextFormField(
//                         prefixIcon: Icon(Icons.person_2_outlined),
//                         controller:
//                             BlocProvider.of<SignupCubit>(context).signUpName,
//                         validator: FormValidator.validateName,
//                         text: "Name",
//                         hintText: "Enter your name",
//                       ),
//                       Gap(30.h),
//                       MyTextFormField(
//                         prefixIcon: Icon(Icons.location_city_outlined),
//                         // controller: BlocProvider.of<SignupCubit>(context).,
//                         validator: FormValidator.validateLocation,
//                         text: "Location",
//                         hintText: "Enter your location",
//                       ),
//                       Gap(30.h),
//                       MyTextFormField(
//                         prefixIcon: Icon(Icons.phone),
//                         controller: BlocProvider.of<SignupCubit>(context).signUpPhoneNumber,
//                         validator: FormValidator.validatePhoneNumber,
//                         text: "Phone Number",
//                         hintText: "Enter your phone number",
//                       ),
//                     ],
//                   )),

//                   Gap(30.h),

//                   Align(
//                     alignment: Alignment.center,
//                     child: state is SignUPLoading
//                         ? CircularProgressIndicator()
//                         : MyButton(
//                             style: AppStyles.semiBold14(context)
//                                 .copyWith(color: AppColors.myWhite),
//                             onTap: () {
//                               context.read<SignupCubit>().signup();
//                               // validateThenSignUp(context);
//                               // Navigator.pushNamed(context, Routes.register2);
//                               // context.read<LoginCubit>().signin();
//                             },
//                             text: "Register",
//                             color: AppColors.myBlue,
//                           ),
//                   ),
//                   Gap(15.h),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "have an account? ",
//                         style: AppStyles.semiBold12(context)
//                             .copyWith(color: AppColors.myGrey),
//                       ),
//                       InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(context, Routes.login);
//                           },
//                           child: Text(" Login now ",
//                               style: AppStyles.semiBold12(context)
//                                   .copyWith(color: AppColors.myBlue))),
//                     ],
//                   )
//                 ],
//               ),
//             )));
//       },
//     );
//   }
// }
