import 'package:flutter_modular/flutter_modular.dart';

import 'screens/base_screen.dart';
import 'screens/home_screen.dart';

class HomeModule extends Module {
  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const BaseScreen(),
      children: [
        ModuleRoute(
          '/home',
          module: _HomeModule(),
        )
      ],
    );
  }
}

class _HomeModule extends Module {
  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const HomeScreen(),
    );
  }
}
