import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/screens/splash_screen.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const SplashScreen(),
    );
  }
}
