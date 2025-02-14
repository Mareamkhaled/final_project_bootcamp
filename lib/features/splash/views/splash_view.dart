import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../core/routing/routes.dart';
import '../widgets/splash_body.dart';

class SplashView extends StatelessWidget{
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeIn(
        animate: true,
        duration: const Duration(seconds:3 ),
        child: SplashBody(),
         onFinish: (direction) => Navigator.pushReplacementNamed(context, Routes.onboarding),
         
       
      )
      );
      }
    }