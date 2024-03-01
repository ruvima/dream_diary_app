import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';
import '../../core/shared/models/form_args.dart';
import '../home/module_export.dart';
import 'data/data.dart' as data;
import 'domain/domain.dart' as domain;
import 'presentation/blocs/form/bloc.dart' as form_bloc;
// import 'presentation/blocs/suggestions/bloc.dart' as suggestion_bloc;
import 'presentation/screens/form_screen.dart';
import 'presentation/screens/select_screen.dart';

class FormModule extends Module {
  @override
  List<Module> get imports => [
        HomeModuleExport(),
      ];
  @override
  void binds(i) {
    i.addLazySingleton<data.SuggestionsDatasourceImpl>(
      () => data.SuggestionsDatasourceImpl(),
    );
    i.addLazySingleton<data.SuggestionsRepositotyImpl>(
      () => data.SuggestionsRepositotyImpl(
        suggestionsDatasource: i.get<data.SuggestionsDatasourceImpl>(),
      ),
    );
    i.addLazySingleton<domain.SuggestionsUsecase>(
      () => domain.SuggestionsUsecase(
        iSuggestionsRepositoty: i.get<data.SuggestionsRepositotyImpl>(),
      ),
    );
    i.addLazySingleton<form_bloc.FormBloc>(
      () {
        final formArgs = i.args.data as FormArgs;

        return form_bloc.FormBloc(dreamEntity: formArgs.dream);
      },
      config: BindConfig(
        onDispose: (formBloc) => formBloc.close(),
      ),
    );
  }

  @override
  void routes(r) {
    t getArgument<t>(RouteManager r) => r.args.data as t;

    r.child(
      Modular.initialRoute,
      duration: const Duration(milliseconds: 450),
      transition: TransitionType.downToUp,
      child: (_) {
        final formArgs = r.args.data as FormArgs;

        return FormScreen(
          dreamEntity: formArgs.dream,
        );
      },
    );
    r.child(
      '/select_view',
      transition: TransitionType.downToUp,
      child: (_) => SelectScreen(
        selectType: getArgument<SelectType>(r),
      ),
    );
  }
}
