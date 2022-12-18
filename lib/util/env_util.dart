import 'dart:io';

class EnvUtil {
  static int get serverPort =>
      int.tryParse(Platform.environment['SERVER_PORT'] ?? '8080') ?? 8080;
}
