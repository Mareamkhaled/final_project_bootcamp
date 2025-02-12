import 'package:final_project_bootcamp/features/onboarding/views/onboarding_view.dart';
import 'package:flutter/material.dart';

import '../../features/splash/views/splash_view.dart';
import 'routes.dart';


class Routing {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => SplashView());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingView());
      
               
      default:
        return MaterialPageRoute(builder: (_) => NoRouteScreen());
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("No Route Found"),
    ));
  }
}