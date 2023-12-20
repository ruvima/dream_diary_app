import 'package:flutter_modular/flutter_modular.dart';

import '../../core/shared/domain/domain.dart';
import '../analysis/module.dart';
import '../form/module.dart';
import '../search/module.dart';
import '../setting/module.dart';
import 'blocs/dream/bloc.dart';
import 'data/repositories/local_storage_repository_impl.dart';
import 'domain/domain.dart';
import 'presentation/screens/base_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/widgets/dream_details.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<LocalStorageRepository>(
      () => LocalStorageRepositoryImpl(),
    );
    i.addSingleton<DreamBloc>(
      () => DreamBloc(
        localStorageRepository: i.get<LocalStorageRepository>(),
      )..add(
          LoadDreamsEvent(),
        ),
    );
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const BaseScreen(),
      children: [
        ModuleRoute(
          '/home',
          transition: TransitionType.noTransition,
          module: _HomeModule(),
        ),
        ModuleRoute(
          '/analysis',
          transition: TransitionType.noTransition,
          module: AnalysisModule(),
        ),
        ModuleRoute(
          '/search',
          transition: TransitionType.noTransition,
          module: SearchModule(),
        ),
        ModuleRoute(
          '/settings',
          transition: TransitionType.noTransition,
          module: SettingsModule(),
        ),
      ],
    );

    r.module(
      '/form',
      module: FormModule(),
    );
    r.child(
      '/dream_details',
      transition: TransitionType.rightToLeft,
      child: (_) => DreamDetailsScreen(
        dream: r.args.data as DreamEntity,
      ),
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
