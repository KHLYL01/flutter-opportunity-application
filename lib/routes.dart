import 'package:get/get.dart';

import 'bindings/add_report_bindings.dart';
import 'bindings/company_profile_bindings.dart';
import 'bindings/company_request_bindings.dart';
import 'bindings/free_category_bindings.dart';
import 'bindings/job_category_bindings.dart';
import 'bindings/pdf_file_bindings.dart';
import 'bindings/refresh_token_bindings.dart';
import 'bindings/register_bindings.dart';
import 'bindings/home_bindings.dart';
import 'bindings/login_bindings.dart';
import 'bindings/splash_bindings.dart';
import 'bindings/user_profile_bindings.dart';
import 'bindings/user_request_bindings.dart';
import 'core/middleware/middleware.dart';
import 'bindings/job_sub_category_bindings.dart';
import 'core/constants/app_routes.dart';
import 'view/screen/admin_company_request_page.dart';
import 'view/screen/auth/waiting_page.dart';
import 'view/screen/company_profile/add_job_page.dart';
import 'view/screen/company_requests_page.dart';
import 'view/screen/user_requests_page.dart';
import 'view/screen/user_profile/add_free_job_page.dart';
import 'view/screen/category/add_category_page.dart';
import 'view/screen/add_report_page.dart';
import 'view/screen/category/update_category_page.dart';
import 'view/screen/free_category/add_free_category_page.dart';
import 'view/screen/free_category/free_category_page.dart';
import 'view/screen/free_category/update_free_category_page.dart';
import 'view/screen/sub_category/add_sub_category_page.dart';
import 'view/screen/category/category_page.dart';
import 'view/screen/reported_companies_page.dart';
import 'view/screen/reports_page.dart';
import 'view/screen/sub_category/sub_category_page.dart';
import 'view/screen/sub_category/update_sub_category_page.dart';
import 'view/screen/auth/register_page.dart';
import 'view/screen/auth/welcome_page.dart';
import 'view/screen/company_profile/company_profile_page.dart';
import 'view/screen/company_profile/company_update_profile_page.dart';
import 'view/screen/home_page.dart';
import 'view/screen/auth/login_page.dart';
import 'view/screen/job_details_page.dart';
import 'view/screen/auth/refresh_token_page.dart';
import 'view/screen/notifications_page.dart';
import 'view/screen/view_company_profile_page.dart';
import 'view/screen/view_user_profile_page.dart';
import 'view/screen/view_util/pdf_file_page.dart';
import 'view/screen/auth/splash_page.dart';
import 'view/screen/user_profile/user_profile_page.dart';
import 'view/screen/user_profile/user_update_profile_page.dart';

List<GetPage<dynamic>> routes = [
  ///
  /// Welcome ===============================
  ///

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

  ///
  /// Auth ===============================
  ///

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
    name: AppRoutes.waitingPage,
    page: () => const WaitingPage(),
  ),

  ///
  /// Home ===============================
  ///

  GetPage(
    name: AppRoutes.homePage,
    page: () => const HomePage(),
    binding: HomeBindings(),
  ),

  ///
  /// User Profile ===============================
  ///

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
    name: AppRoutes.addFreeJobPage,
    page: () => const AddFreeJobPage(),
  ),
  GetPage(
    name: AppRoutes.viewUserProfilePage,
    page: () => const ViewUserProfilePage(),
  ),

  ///
  /// Company Profile ===============================
  ///

  GetPage(
    name: AppRoutes.companyProfilePage,
    page: () => const CompanyProfilePage(),
    binding: CompanyProfileBindings(),
  ),
  GetPage(
    name: AppRoutes.companyUpdateProfilePage,
    page: () => const CompanyUpdateProfilePage(),
  ),
  GetPage(
    name: AppRoutes.addJobPage,
    page: () => const AddJobPage(),
  ),

  GetPage(
    name: AppRoutes.viewCompanyProfilePage,
    page: () => const ViewCompanyProfilePage(),
  ),

  ///
  /// Category ===============================
  ///

  GetPage(
    name: AppRoutes.categoryPage,
    page: () => const CategoriesPage(),
    binding: JobCategoryBindings(),
  ),
  GetPage(
    name: AppRoutes.addCategoryPage,
    page: () => const AddCategoryPage(),
  ),
  GetPage(
    name: AppRoutes.updateCategoryPage,
    page: () => const UpdateCategoryPage(),
  ),

  ///
  /// Sub Category ===============================
  ///

  GetPage(
    name: AppRoutes.subCategoryPage,
    page: () => const SubCategoriesPage(),
    binding: JobSubCategoryBindings(),
  ),
  GetPage(
    name: AppRoutes.addSubCategoryPage,
    page: () => const AddSubCategoryPage(),
  ),
  GetPage(
    name: AppRoutes.updateSubCategoryPage,
    page: () => const UpdateSubCategoryPage(),
  ),

  ///
  /// Free Category ===============================
  ///

  GetPage(
    name: AppRoutes.freeCategoryPage,
    page: () => const FreeCategoriesPage(),
    binding: FreeCategoryBindings(),
  ),
  GetPage(
    name: AppRoutes.addFreeCategoryPage,
    page: () => const AddFreeCategoryPage(),
  ),
  GetPage(
    name: AppRoutes.updateFreeCategoryPage,
    page: () => const UpdateFreeCategoryPage(),
  ),

  ///
  /// Pdf File ===============================
  ///

  GetPage(
    name: AppRoutes.pdfFilePage,
    page: () => const PdfFilePage(),
    binding: PdfFileBindings(),
  ),

  ///
  /// Notification ===============================
  ///

  GetPage(
    name: AppRoutes.notificationsPage,
    page: () => const NotificationsPage(),
  ),

  ///
  ///  Report ===============================
  ///

  GetPage(
    name: AppRoutes.reportPage,
    page: () => const ReportPage(),
  ),
  GetPage(
    name: AppRoutes.addReportPage,
    page: () => const AddReportPage(),
    binding: AddReportBindings(),
  ),
  GetPage(
    name: AppRoutes.companyReportPage,
    page: () => const CompanyReportPage(),
  ),

  GetPage(
    name: AppRoutes.jobDetailsPage,
    page: () => const JopDetailsPage(),
  ),

  GetPage(
    name: AppRoutes.userRequestPage,
    page: () => const UserRequestPage(),
    binding: UserRequestBindings(),
  ),
  GetPage(
    name: AppRoutes.companyRequestPage,
    page: () => const CompanyRequestPage(),
    binding: CompanyRequestBindings(),
  ),

  GetPage(
    name: AppRoutes.adminCompanyRequestPage,
    page: () => const AdminCompanyRequestPage(),
  ),
];
