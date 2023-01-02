import 'package:get_it/get_it.dart';

import '../service/token_service.dart';
import '../service/user_auth_service.dart';

final di = GetIt.instance;

void setupServices() {
  di.registerSingleton<UserAuthService>(UserAuthServiceImpl());
  di.registerSingleton<TokenService>(TokenServiceImpl());
}
