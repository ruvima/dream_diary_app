import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/screens/settings_screens.dart';

class SettingsModule extends Module {
  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const SettingsScreen(),
    );
  }
}
