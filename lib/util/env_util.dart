import 'dart:io';

class EnvUtil {
  static int get serverPort =>
      int.tryParse(Platform.environment['SERVER_PORT'] ?? '8080') ?? 8080;

  static String get dbAddress =>
      Platform.environment['DB_ADDRESS'] ?? 'http://localhost:3306';
  static String get dbName => Platform.environment['DB_NAME'] ?? 'dartAuthTest';

  static String get jwtSecret =>
      Platform.environment['JWT_SECRET'] ??
      'my-super-secret-jwt-secret-which-is-not-so-secure-after-all';
}
