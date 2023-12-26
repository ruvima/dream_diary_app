import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';
import '../../core/shared/local/isar_db/local_db.dart';
import '../../core/shared/models/form_args.dart';
import 'data/datasource/form_datasource_impl.dart';
import 'data/repository/form_repository_impl.dart';
import 'domain/repositories/form_repository.dart';
import 'domain/usecases/form_usecases.dart';
import 'presentation/blocs/form/bloc.dart' as form_bloc;
import 'presentation/screens/form_screen.dart';
import 'presentation/screens/select_screen.dart';

class FormModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<FormRepository>(
      () {
        return FormRepositoryImpl(
          formDatasource: FormDatasourceImpl(
            localDb: i.get<LocalDb>(),
          ),
        );
      },
    );

    i.addSingleton<CreateDream>(
      () => CreateDream(
        repository: i.get<FormRepository>(),
      ),
    );
    i.addSingleton<UpdateDream>(
      () => UpdateDream(
        repository: i.get<FormRepository>(),
      ),
    );

    i.addSingleton<form_bloc.FormBloc>(
      () => form_bloc.FormBloc(
        createDream: i.get<CreateDream>(),
        updateDream: i.get<UpdateDream>(),
      ),
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

        Modular.get<form_bloc.FormBloc>().add(
          form_bloc.FormTypeChangedEvent(
            formArgs.formType,
          ),
        );

        Modular.get<form_bloc.FormBloc>().add(
          form_bloc.EnterFormEvent(
            dreamEntity: formArgs.dream,
          ),
        );

        return const FormScreen();
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
