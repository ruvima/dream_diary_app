import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/shared/domain/domain.dart';
import '../../../../home/blocs/dream/bloc.dart' as dream_bloc;

part 'event.dart';
part 'state.dart';

class FormBloc extends Bloc<Event, State> {
  final dream_bloc.DreamBloc _dreamBloc;

  FormBloc({required dream_bloc.DreamBloc dreamBloc})
      : _dreamBloc = dreamBloc,
        super(InitialState(Model())) {
    on<FormSavedEvent>(_formSavedEvent);

    on<DateChangedEvent>(_onDateChanged);

    on<ClarityChangedEvent>(_onClarityChanged);

    on<DreamTypesChangedEvent>(_onDreamTypesChanged);

    on<EmotionsChangedEvent>(_onEmotionsChanged);

    on<PeopleChangedEvent>(_onPeopleChanged);

    on<TagsChangedEvent>(_onTagsChanged);

    on<DescriptionChangedEvent>(_onDescriptionChanged);

    on<TitleChangedEvent>(_onTitleChanged);
  }

  Future<void> _formSavedEvent(
      FormSavedEvent event, Emitter<State> emit) async {
    emit(LoadingState(state.model));

    final dreamEntity = state.model.toEntity();

    _dreamBloc.add(
      dream_bloc.AddDreamEvent(dreamEntity: dreamEntity),
    );
    emit(FormSavedState(state.model));
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
