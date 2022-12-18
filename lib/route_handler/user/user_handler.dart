import 'dart:async';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserHandler {
  Handler get handler {
    final router = Router();

    router.post('/register', _register);
    router.post('/login', _login);
    router.post('/logout', _logout);

    return router;
  }

  FutureOr<Response> _register(Request _) {
    return Response.ok('register');
  }

  FutureOr<Response> _login(Request _) {
    return Response.ok('login');
  }

  FutureOr<Response> _logout(Request _) {
    return Response.ok('logout');
  }
}
