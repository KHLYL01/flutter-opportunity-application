import 'package:get/get.dart';

import 'bindings/splash_bindings.dart';
import 'core/constants/app_routes.dart';
import 'view/screen/splash_page.dart';
import 'view/screen/welcome_page.dart';
import 'view/screen/register_page.dart';

List<GetPage<dynamic>> routes = [
  // GetPage(name: AppRoute.onBoardingPage, page: () => const Questions()),
  GetPage(
    name: AppRoutes.splashPage,
    page: () => const SplashPage(),
    binding: SplashBindings(),
  ),
  GetPage(
    name: AppRoutes.welcomePage,
    page: () => const WelcomePage(),
  ),

  GetPage(
    name: AppRoutes.registerPage,
    page: () => const RegisterPage(),
  ),
];
