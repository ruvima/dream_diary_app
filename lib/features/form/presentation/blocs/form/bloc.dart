import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/constants/enums.dart';
import '../../../../../core/shared/domain/domain.dart';
import '../../../domain/usecases/form_usecases.dart';

part 'event.dart';
part 'state.dart';

class FormBloc extends Bloc<Event, State> {
  final CreateDream _createDream;
  final UpdateDream _updateDream;

  FormBloc({
    required CreateDream createDream,
    required UpdateDream updateDream,
  })  : _createDream = createDream,
        _updateDream = updateDream,
        super(
          InitialState(
            Model(),
          ),
        ) {
    on<FormSavedEvent>(_formSavedEvent);

    on<EnterFormEvent>(_onEnterFormEvent);

    on<FormTypeChangedEvent>(_onFormTypeChanged);

    on<DateChangedEvent>(_onDateChanged);

    on<ClarityChangedEvent>(_onClarityChanged);

    on<DreamTypesChangedEvent>(_onDreamTypesChanged);

    on<EmotionsChangedEvent>(_onEmotionsChanged);

    on<PeopleChangedEvent>(_onPeopleChanged);

    on<PlaceChangedEvent>(_onPlaceChanged);

    on<TagsChangedEvent>(_onTagsChanged);

    on<DescriptionChangedEvent>(_onDescriptionChanged);

    on<TitleChangedEvent>(_onTitleChanged);
  }

  void _onEnterFormEvent(EnterFormEvent event, Emitter<State> emit) {
    final dream = event.dreamEntity;
    if (dream != null) {
      emit(
        FormChangedState(
          state.model.copyWith(
            date: dream.date,
            clarity: dream.clarity,
            dreamTypes: dream.dreamTypes,
            emotions: dream.emotions,
            people: dream.emotions,
            places: dream.places,
            description: dream.description,
            id: dream.id,
            tags: dream.tags,
            title: dream.title,
          ),
        ),
      );
    }
  }

  void _onFormTypeChanged(FormTypeChangedEvent event, Emitter<State> emit) {
    emit(
      FormChangedState(
        state.model.copyWith(formType: event.formType),
      ),
    );
  }

  Future<void> _formSavedEvent(
      FormSavedEvent event, Emitter<State> emit) async {
    emit(LoadingState(state.model));

    try {
      final dreamEntity = state.model.toEntity();

      if (state.model.formType == FormType.edit) {
        await _updateDream.execute(dreamEntity);
      } else if (state.model.formType == FormType.create) {
        await _createDream.execute(dreamEntity);
      }
      emit(FormSavedState(state.model));
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

  void _onDateChanged(DateChangedEvent event, Emitter<State> emit) {
    emit(
      FormChangedState(
        state.model.copyWith(date: event.date),
      ),
    );
  }

  void _onClarityChanged(ClarityChangedEvent event, Emitter<State> emit) {
    emit(
      FormChangedState(
        state.model.copyWith(clarity: event.clarity),
      ),
    );
  }

  void _onDreamTypesChanged(DreamTypesChangedEvent event, Emitter<State> emit) {
    List<String> dreamTypes = List.from(state.model.dreamTypes);

    if (dreamTypes.contains(event.dreamType)) {
      dreamTypes = dreamTypes
          .where((dreamType) => dreamType != event.dreamType)
          .toList();
    } else {
      dreamTypes = [event.dreamType, ...dreamTypes];
    }

    emit(
      FormChangedState(
        state.model.copyWith(dreamTypes: dreamTypes),
      ),
    );
  }

  void _onEmotionsChanged(EmotionsChangedEvent event, Emitter<State> emit) {
    List<String> emotions = List.from(state.model.emotions);

    if (emotions.contains(event.emotion)) {
      emotions =
          emotions.where((dreamType) => dreamType != event.emotion).toList();
    } else {
      emotions = [event.emotion, ...emotions];
    }

    emit(
      FormChangedState(
        state.model.copyWith(emotions: emotions),
      ),
    );
  }

  void _onPeopleChanged(PeopleChangedEvent event, Emitter<State> emit) {
    List<String> people = List.from(state.model.people);

    if (people.contains(event.person)) {
      people = people.where((person) => person != event.person).toList();
    } else {
      people = [event.person, ...people];
    }

    emit(
      FormChangedState(
        state.model.copyWith(people: people),
      ),
    );
  }

  void _onPlaceChanged(PlaceChangedEvent event, Emitter<State> emit) {
    List<String> places = List.from(state.model.places);

    if (places.contains(event.place)) {
      places = places.where((person) => person != event.place).toList();
    } else {
      places = [event.place, ...places];
    }

    emit(
      FormChangedState(
        state.model.copyWith(places: places),
      ),
    );
  }

  void _onTagsChanged(TagsChangedEvent event, Emitter<State> emit) {
    List<String> tags = List.from(state.model.tags);

    if (tags.contains(event.tag)) {
      tags = tags.where((tag) => tag != event.tag).toList();
    } else {
      tags = [event.tag, ...tags];
    }

    emit(
      FormChangedState(
        state.model.copyWith(tags: tags),
      ),
    );
  }

  void _onDescriptionChanged(
      DescriptionChangedEvent event, Emitter<State> emit) {
    emit(
      FormChangedState(
        state.model.copyWith(description: event.description),
      ),
    );
  }

  void _onTitleChanged(TitleChangedEvent event, Emitter<State> emit) {
    emit(
      FormChangedState(
        state.model.copyWith(title: event.title),
      ),
    );
  }
}
