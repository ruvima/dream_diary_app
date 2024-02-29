import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/constants/enums.dart';
import '../../../../../core/shared/errors/failures/failures.dart';
import '../../../../home/domain/domain.dart';

part 'event.dart';
part 'state.dart';

class SaveDreamBloc extends Bloc<Event, State> {
  SaveDreamBloc({
    CreateDreamUsecase? createDream,
    UpdateDreamUsecase? updateDream,
  })  : _createDream = createDream ?? Modular.get<CreateDreamUsecase>(),
        _updateDream = updateDream ?? Modular.get<UpdateDreamUsecase>(),
        super(
          const InitialState(Model()),
        ) {
    on<FormSavedEvent>(_formSavedEvent);
  }

  final CreateDreamUsecase _createDream;
  final UpdateDreamUsecase _updateDream;

  Future<void> _formSavedEvent(
    FormSavedEvent event,
    Emitter<State> emit,
  ) async {
    emit(LoadingState(state.model));

    try {
      final dreamEntity = event.dreamEntity;

      if (event.formType == FormType.edit) {
        await _updateDream.execute(dreamEntity);
      } else if (event.formType == FormType.create) {
        await _createDream.execute(dreamEntity);
      }
      emit(LoadedState(state.model));
    } catch (e) {
      if (e is DatabaseFailure) {
        emit(
          ErrorState(
            state.model.copyWith(error: e.message),
          ),
        );
      } else {
        emit(
          ErrorState(
            state.model.copyWith(error: '$e'),
          ),
        );
      }
    }
  }
}
