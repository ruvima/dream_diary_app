import 'package:flutter_modular/flutter_modular.dart';

import '../../core/shared/local/isar_db/local_db.dart';
import '../analysis/module.dart';
import '../form/module.dart';
import '../search/module.dart';
import '../settings/module.dart';
import 'blocs/dream/bloc.dart';
import 'data/datasource/dream_datasource_impl.dart';
import 'data/repositories/dream_repository_impl.dart';
import 'domain/domain.dart';
import 'domain/usecases/dream_usecases.dart';
import 'presentation/screens/base_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/widgets/dream_details.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<DreamRepository>(
      () {
        return DreamRepositoryImpl(
          datasource: DreamDatasourceImpl(
            localDb: i.get<LocalDb>(),
          ),
        );
      },
    );
    i.addSingleton<FetchDreams>(
      () => FetchDreams(
        repository: i.get<DreamRepository>(),
      ),
    );
    i.addSingleton<DeleteDream>(
      () => DeleteDream(
        repository: i.get<DreamRepository>(),
      ),
    );
    i.addSingleton<DreamBloc>(
      () => DreamBloc(
        fetchDreams: i.get<FetchDreams>(),
        deleteDream: i.get<DeleteDream>(),
      )..add(
          InitEvenet(),
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
        dreamId: r.args.data as String,
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
