import 'package:flutter_modular/flutter_modular.dart';

import '../analysis/module.dart';
import '../form/module.dart';
import '../search/module.dart';
import '../settings/module.dart';
import 'domain/domain.dart';
import 'module_export.dart';
import 'presentation/blocs/dream/bloc.dart';
import 'presentation/screens/base_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/widgets/dream_details.dart';

//TODO: HACER EXPORTABLE EL MODULO PARA HACER CRUD DE LOCAL DB
// TODO: EL MODULO SERA USADO POR HOME, FORM Y SEARCH
// TODO: POR PENSARLO EL BLOC DE DREAMS SERA GLOBAL

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        HomeModuleExport(),
      ];

  @override
  void binds(Injector i) async {
    i.addSingleton<DreamBloc>(
      () => DreamBloc(
        fetchDreams: i.get<GetDreamsUsecase>(),
        deleteDream: i.get<DeleteDreamUsecase>(),
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
