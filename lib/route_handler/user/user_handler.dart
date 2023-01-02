import 'dart:async';
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../service/user_auth_service.dart';
import '../../util/locator.dart';

class UserHandler {
  Handler get handler {
    final router = Router();

    router.post('/register', _register);
    router.post('/login', _login);
    router.post('/logout', _logout);

    return router;
  }

  FutureOr<Response> _register(Request req) async {
    final Map<String, dynamic> reqMap = jsonDecode(await req.readAsString());

    final String email = reqMap['email'];
    final String password = reqMap['password'];

    final String refreshToken =
        await di<UserAuthService>().createUser(email, password);

    final response = {'refresh_token': refreshToken};

    return Response.ok(jsonEncode(response));
  }

  FutureOr<Response> _login(Request _) {
    return Response.ok('login');
  }

  FutureOr<Response> _logout(Request _) {
    return Response.ok('logout');
  }
}
