import 'package:dio/dio.dart';
import 'package:final_project_bootcamp/features/home/ui/screens/home_view.dart';
import 'package:final_project_bootcamp/features/profile/profile_view.dart';
import 'package:final_project_bootcamp/features/signup/logic/cubit/signup_cubit.dart';
import 'package:final_project_bootcamp/features/signup/ui/views/signup_view.dart';
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
      case Routes.home:
        return MaterialPageRoute(builder: (context) => HomeView());
      case Routes.profile:
        return MaterialPageRoute(builder: (context) => MultiBlocProvider(
            providers: [
               BlocProvider<LoginCubit>(
                      create: (context) => LoginCubit(DioConsumer(dio: Dio())),
               )
            ],child: ProfileScreen()),
          );
      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginCubit(DioConsumer(dio: Dio())),
                  child: LogInView(),
                ));
      case Routes.register:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SignupCubit(
                    DioConsumer(dio: Dio()),
                  ),
                  child: SignUpView(),
                ));
      // case Routes.register2:
      //   return MaterialPageRoute(
      //       builder: (context) => MultiBlocProvider(
      //             providers: [
      //               BlocProvider<SignupCubit>(
      //                 create: (context) => SignupCubit(DioConsumer(dio: Dio())),
      //               ),
      //             ],
      //             child: SignupViewTwo(),
      //           ));

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
