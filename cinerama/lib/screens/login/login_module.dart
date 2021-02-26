import 'package:flutter_modular/flutter_modular.dart';

import '../../global/app_routes.dart';
import '../../stores/login/login_store.dart';
import 'login_screen.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginStore()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(AppLoginRoutes.loginHome, child: (_, __) => const LoginScreen()),
        // ModularRouter(AppLoginRoutes.loginWelcome, child: (_, __) => const LoginScreen()),
        // ModularRouter(AppLoginRoutes.loginRequestPerm, child: (_, __) => const LoginScreen()),
        // ModularRouter(AppLoginRoutes.loginPermGranted, child: (_, __) => const LoginScreen()),
        // ModularRouter(AppLoginRoutes.loginCompleted, child: (_, __) => const LoginScreen()),
      ];
}
