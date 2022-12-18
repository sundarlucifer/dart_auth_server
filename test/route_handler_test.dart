import 'dart:io';

import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  const port = '8080';
  const host = 'http://0.0.0.0:$port';
  late Process p;

  setUp(() async {
    p = await Process.start(
      'dart',
      ['run', 'bin/server.dart'],
      environment: {'PORT': port},
    );
    // Wait for server to start and print to stdout.
    await p.stdout.first;
  });

  tearDown(() => p.kill());

  group('An api exists in $host', () {
    group('/user', () {
      final user = '$host/user';

      test('/register POST', () async {
        final response = await post(Uri.parse('$user/register'));
        expect(response.statusCode, 200);
      });

      test('/login POST', () async {
        final response = await post(Uri.parse('$user/login'));
        expect(response.statusCode, 200);
      });

      test('/logout POST', () async {
        final response = await post(Uri.parse('$user/logout'));
        expect(response.statusCode, 200);
      });
    });
  });
}
