
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../api/api_consumer.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/login/ui/views/login_view.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/splash/views/splash_view.dart';
import '../../test.dart';
import '../api/dio_consumer.dart';
import 'routes.dart';

class Routing {
  // final api = ApiConsumer();
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => SplashView());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingView());
      case Routes.test:
        return MaterialPageRoute(builder: (context) => Test());
      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginCubit(DioConsumer(dio: Dio())),
                  child: LogInView(),
                ));

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