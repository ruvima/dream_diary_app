import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core.dart';
import '../../core/shared/models/form_args.dart';
import '../home/domain/domain.dart';
import '../home/module_export.dart';
import 'presentation/blocs/form/bloc.dart' as form_bloc;
import 'presentation/screens/form_screen.dart';
import 'presentation/screens/select_screen.dart';

class FormModule extends Module {
  @override
  List<Module> get imports => [
        HomeModuleExport(),
      ];
  @override
  void binds(i) {
    i.addSingleton<form_bloc.FormBloc>(
      () => form_bloc.FormBloc(
        createDream: i.get<CreateDreamUsecase>(),
        updateDream: i.get<UpdateDreamUsecase>(),
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
