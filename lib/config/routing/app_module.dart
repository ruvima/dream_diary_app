import 'package:flutter_modular/flutter_modular.dart';

import '../../features/auth/module.dart';
import '../../features/home/module.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/tutorial/module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const SplashScreen(),
    );
    r.module('/tutorial', module: TutorialModule());
    r.module('/auth', module: AuthModule());
    r.module('/home', module: HomeModule());
  }
}
