import 'package:get/get.dart';

import 'bindings/pdf_file_bindings.dart';
import 'bindings/refresh_token_bindings.dart';
import 'bindings/register_bindings.dart';
import 'bindings/home_bindings.dart';
import 'bindings/login_bindings.dart';
import 'bindings/user_profile_bindings.dart';
import 'core/middleware/middleware.dart';
import 'core/constants/app_routes.dart';
import 'view/screen/add_free_job_page.dart';
import 'view/screen/auth/register_page.dart';
import 'view/screen/auth/welcome_page.dart';
import 'view/screen/company_profile_page.dart';
import 'view/screen/home_page.dart';
import 'view/screen/auth/login_page.dart';
import 'view/screen/job_details_page.dart';
import 'view/screen/auth/refresh_token_page.dart';
import 'view/screen/notifications_page.dart';
import 'view/screen/pdf_file_page.dart';
import 'view/screen/user_profile_page.dart';
import 'view/screen/user_update_profile_page.dart';

List<GetPage<dynamic>> routes = [
  // GetPage(
  //   name: AppRoutes.splashPage,
  //   page: () => const SplashPage(),
  //   binding: SplashBindings(),
  // ),
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
    binding: HomeBindings(),
  ),
  GetPage(
    name: AppRoutes.jobDetailsPage,
    page: () => const JopDetailsPage(),
  ),
  GetPage(
    name: AppRoutes.companyProfilePage,
    page: () => const CompanyProfilePage(),
  ),
  GetPage(
    name: AppRoutes.userProfilePage,
    page: () => const UserProfilePage(),
    binding: UserProfileBindings(),
  ),
  GetPage(
    name: AppRoutes.userUpdateProfilePage,
    page: () => const UserUpdateProfilePage(),
  ),
  GetPage(
    name: AppRoutes.pdfFilePage,
    page: () => const PdfFilePage(),
    binding: PdfFileBindings(),
  ),
  GetPage(
    name: AppRoutes.notificationsPage,
    page: () => const NotificationsPage(),
  ),
  GetPage(
    name: AppRoutes.addFreeJobPage,
    page: () => const AddFreeJobPage(),
  ),
];
