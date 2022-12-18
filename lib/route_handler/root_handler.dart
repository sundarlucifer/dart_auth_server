import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'user/user_handler.dart';

class RootHandler {
  Handler get handler {
    final router = Router();

    router.mount('/user', UserHandler().handler);

    final middlewares = Pipeline() //
        .addMiddleware(logRequests());

    final rootHandler = middlewares.addHandler(router);

    return rootHandler;
  }
}
