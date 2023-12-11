import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/screens/tutorial_screen.dart';

class TutorialModule extends Module {
  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const TutorialScreen(),
    );
  }
}
