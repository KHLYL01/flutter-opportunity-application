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

  static const String users = '$baseUrl/users';
  static const String courses = '$baseUrl/courses';
  static const String groups = '$baseUrl/groups';
  static const String parts = '$baseUrl/parts';
  static const String lessons = '$baseUrl/lessons';
  static const String files = '$baseUrl/files';
  static const String quizzes = '$baseUrl/quizzes';
  static const String items = '$baseUrl/items';
  static const String attempts = '$baseUrl/attempts';
  static const String notifications = '$baseUrl/notifications';
  static const String partCodes = '$baseUrl/part-codes';
  static const String activeCodes = '$baseUrl/actives';
  static const String codes = '$baseUrl/codes';
}
