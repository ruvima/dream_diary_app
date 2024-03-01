import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/shared/errors/failures/failures.dart';
import '../../../domain/domain.dart';

part 'event.dart';
part 'state.dart';

class DeleteDreamBloc extends Bloc<Event, State> {
  DeleteDreamBloc({
    DeleteDreamUsecase? deleteDream,
    UpdateDreamUsecase? updateDream,
  })  : _deleteDream = deleteDream ?? Modular.get<DeleteDreamUsecase>(),
        super(
          const InitialState(Model()),
        ) {
    on<DeleteDreamEvent>(_onDeleteDreamEvent);
  }

  final DeleteDreamUsecase _deleteDream;

  Future<void> _onDeleteDreamEvent(DeleteDreamEvent event, Emitter emit) async {
    emit(LoadingState(state.model));

    try {
      await _deleteDream.execute(event.id);
    } catch (e) {
      final errorMessage =
          e is DatabaseFailure ? e.message : 'An unexpected error occurred';
      emit(
        ErrorState(
          state.model.copyWith(error: errorMessage),
        ),
      );
    }
  }
}
