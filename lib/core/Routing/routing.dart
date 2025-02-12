import 'package:flutter/material.dart';

import '../../features/splash/views/splash_view.dart';
import 'routes.dart';


class Routing {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => SplashView());
      
               
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