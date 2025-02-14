import 'package:dio/dio.dart';

import '../../features/profile/profile_view.dart';
import '../../features/signup/logic/cubit/signup_cubit.dart';
import '../../features/signup/ui/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/models/clothes_model.dart';
import '../../features/home/data/repo/clothes_repo.dart';
import '../../features/home/data/services/clothes_service.dart';
import '../../features/home/logic/cubit/products_cubit.dart';
import '../../features/home/presentation/views/main_screen.dart';
import '../../features/home/presentation/views/products_details.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/login/ui/views/login_view.dart';
import '../../features/onboarding/views/onboarding_view.dart';
import '../../features/splash/views/splash_view.dart';
import '../../test.dart';
import '../api/dio_consumer.dart';
import 'routes.dart';

class Routing {
  late ClothesRepo clothesRepo;
  late ProductsCubit productsCubit;

  Routing() {
    clothesRepo = ClothesRepo(clothesWebServices: ClothesWebServices());
    productsCubit = ProductsCubit(clothesRepo);
  }
  // final api = ApiConsumer();
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => SplashView());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingView());
      case Routes.test:
        return MaterialPageRoute(builder: (context) => Test());
      // case Routes.home:
      //   return MaterialPageRoute(builder: (context) => HomeView());
      case Routes.profile:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(providers: [
            BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(DioConsumer(dio: Dio())),
            )
          ], child: ProfileScreen()),
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

      case Routes.allProducts:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => productsCubit,
                  child: const MainScreen(),
                ));
      case Routes.detailProducts:
        //! pass the data in home screen to details screen
        final product = settings.arguments as ProductItem;
        return MaterialPageRoute(
            //! i pass the character as argument because i need it in details screen to use
            builder: (context) => ProductsDetails(
                  product: product,
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
