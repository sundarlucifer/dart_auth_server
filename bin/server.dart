import 'dart:io';

import 'package:dart_auth_server/route_handler/root_handler.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> args) async {
  final address = InternetAddress.loopbackIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final rootHandler = RootHandler().handler;

  final server = await io.serve(rootHandler, address, port);

  print('Server listening on http://${server.address.host}:${server.port}');
}
