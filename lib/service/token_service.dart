import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../util/env_util.dart';

abstract class TokenService {
  String generateRefreshToken(Map claims);

  String generateAccessToken(Map claims);
}

const _refreshTokenLife = Duration(days: 30);
const _accessTokenLife = Duration(minutes: 5);

class TokenServiceImpl extends TokenService {
  @override
  String generateRefreshToken(Map claims) {
    return _generateToken(claims, _refreshTokenLife);
  }

  @override
  String generateAccessToken(Map claims) {
    return _generateToken(claims, _accessTokenLife);
  }

  String _generateToken(Map claims, Duration expiresIn) {
    final jwt = JWT(claims);

    return jwt.sign(SecretKey(EnvUtil.jwtSecret), expiresIn: expiresIn);
  }
}
