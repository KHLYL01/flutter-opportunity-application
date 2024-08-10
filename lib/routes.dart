import 'package:get/get.dart';
import 'package:opportunity_app/bindings/refresh_token_bindings.dart';
import 'package:opportunity_app/bindings/register_bindings.dart';
import 'package:opportunity_app/core/middleware/middleware.dart';
import 'package:opportunity_app/view/screen/home_page.dart';
import 'package:opportunity_app/view/screen/login_page.dart';
import 'package:opportunity_app/view/screen/refresh_token_page.dart';

import 'bindings/login_bindings.dart';
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
    middlewares: [MyMiddleware()],
  ),

  GetPage(
    name: AppRoutes.registerPage,
    page: () => const RegisterPage(),
    binding: RegisterBindings(),
  ),
  GetPage(
    name: AppRoutes.loginPage,
    page: () => const LoginPage(),
    binding: LoginBindings(),
  ),
  GetPage(
    name: AppRoutes.refreshPage,
    page: () => const RefreshTokenPage(),
    binding: RefreshTokenBindings(),
  ),
  GetPage(
    name: AppRoutes.homePage,
    page: () => const HomePage(),
  ),
];
