import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/screens/auth_screen.dart';

class AuthModule extends Module {
  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const AuthScreen(),
    );
  }
}
