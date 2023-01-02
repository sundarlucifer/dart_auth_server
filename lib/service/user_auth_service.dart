import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dart_auth_server/service/token_service.dart';
import 'package:random_string/random_string.dart';

import '../util/exceptions.dart';
import '../util/locator.dart';

abstract class UserAuthService {
  Future<String> createUser(String email, String password);
}

class UserAuthServiceImpl extends UserAuthService {
  // TODO: use a real database connection
  final Map _db = {};

  /// Throws [UserAlreadyExistsError]
  @override
  Future<String> createUser(String email, String password) async {
    if (_db.containsKey(email)) throw UserAlreadyExistsError();

    var salt = randomString(10);
    var saltedPassword = '$password$salt';
    var hashedPassword = sha256.convert(utf8.encode(saltedPassword)).toString();

    var creationTime = DateTime.now().toIso8601String();

    _db[email] = {
      'password': hashedPassword,
      'salt': salt,
      'creationTime': creationTime,
    };

    final Map userData = {email: email};
    final refreshToken = di<TokenService>().generateRefreshToken(userData);

    return refreshToken;
  }
}
