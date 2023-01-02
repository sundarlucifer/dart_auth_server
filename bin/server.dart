import 'dart:io';

import 'package:dart_auth_server/route_handler/root_handler.dart';
import 'package:dart_auth_server/util/env_util.dart';
import 'package:dart_auth_server/util/locator.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> args) async {
  // Utils
  setupServices();

  // Database
  // Initialize a typeorm instance

  // Server
  final rootHandler = RootHandler().handler;

  final address = InternetAddress.loopbackIPv4;
  final port = EnvUtil.serverPort;
  final server = await io.serve(rootHandler, address, port);

  print('Server listening on http://${server.address.host}:${server.port}');
}
