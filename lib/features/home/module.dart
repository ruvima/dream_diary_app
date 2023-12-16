import 'package:flutter_modular/flutter_modular.dart';

import '../analysis/module.dart';
import '../search/module.dart';
import '../tools/module.dart';
import 'data/repositories/dream_repository_impl.dart';
import 'domain/domain.dart';
import 'screens/base_screen.dart';
import 'screens/home_screen.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<DreamRepository>(() => DreamRepositoryImpl());
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const BaseScreen(),
      children: [
        ModuleRoute(
          '/home',
          transition: TransitionType.downToUp,
          module: _HomeModule(),
        ),
        ModuleRoute(
          '/analysis',
          transition: TransitionType.downToUp,
          module: AnalysisModule(),
        ),
        ModuleRoute(
          '/search',
          transition: TransitionType.downToUp,
          module: SearchModule(),
        ),
        ModuleRoute(
          '/tools',
          transition: TransitionType.downToUp,
          module: ToolsModule(),
        ),
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
