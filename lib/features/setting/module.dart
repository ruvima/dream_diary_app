import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/screens/tools_screens.dart';

class SettingsModule extends Module {
  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const SettingsScreen(),
    );
  }
}
