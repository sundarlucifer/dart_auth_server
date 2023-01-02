import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../util/exceptions.dart';

Middleware catchExceptions() {
  return (Handler handler) {
    return (Request request) async {
      try {
        return await handler(request);
      } catch (error, stackTrace) {
        if (error is CustomError) {
          final Map response = {'error': error.toString()};
          return Response.internalServerError(body: jsonEncode(response));
        } else {
          print(error);
          print(stackTrace);
          return Response.internalServerError();
        }
      }
    };
  };
}
