class AppLink {
  //real phone
  static const String baseUrl = 'http://192.168.1.6:8080/api/v1';
  //emulator
  // static const String baseUrl = 'http://10.0.2.2:8080/api/v1';

  // ======================= Auth Url ==============================
  static const String baseAuth = '$baseUrl/auth';
  static const String register = '$baseAuth/register';
  static const String login = '$baseAuth/login';
  static const String refreshToken = '$baseAuth/refresh';

  // ======================= User & Admin ==========================
  static const String admin = '$baseUrl/admins';

  static const String jobCategories = '$baseUrl/job_categories';
  static const String jobSubCategories = '$baseUrl/job_sub_categories';
  static const String freeCategories = '$baseUrl/free_categories';
  static const String userProfile = '$baseUrl/profiles';
  static const String images = '$baseUrl/images';
  static const String freeJobs = '$baseUrl/free_opportunities';
  static const String companyProfile = '$baseUrl/companies';
  static const String jobs = '$baseUrl/jobs';
  static const String applies = '$baseUrl/applies';
  static const String reports = '$baseUrl/reports';
  static const String rates = '$baseUrl/rates';
}
