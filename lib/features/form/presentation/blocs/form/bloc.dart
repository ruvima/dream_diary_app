import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/domain/domain.dart';

part 'event.dart';
part 'state.dart';

class FormBloc extends Bloc<Event, State> {
  FormBloc({DreamEntity? dreamEntity})
      : _dreamEntity = dreamEntity,
        super(
          InitialState(Model()),
        ) {
    on<EditFormEvent>(_onEditFormEvent);
    on<InitialValuesEvent>(_onInitialValuesEvent);
    _init();
  }

  final DreamEntity? _dreamEntity;

  void _init() {
    if (_dreamEntity != null) {
      titleController.text = _dreamEntity?.title ?? '';
      descController.text = _dreamEntity?.description ?? '';
      add(
        InitialValuesEvent(
          date: _dreamEntity?.date ?? DateTime.now(),
          clarity: _dreamEntity?.clarity ?? 0,
          dreamTypes: _dreamEntity?.dreamTypes ?? [],
          emotions: _dreamEntity?.emotions ?? [],
          people: _dreamEntity?.people ?? [],
          places: _dreamEntity?.places ?? [],
          tags: _dreamEntity?.tags ?? [],
        ),
      );
    }
  }

  final titleController = TextEditingController();
  final descController = TextEditingController();

  String get title => titleController.text.trim();
  String get description => descController.text.trim();

  void _onEditFormEvent(
    EditFormEvent event,
    Emitter<State> emit,
  ) {
    emit(
      FormChangedState(
        state.model.copyWith(
          date: event.date,
          clarity: event.clarity,
          dreamTypes: _getList(
            event.dreamType ?? '',
            state.model.dreamTypes,
          ),
          emotions: _getList(
            event.emotion ?? '',
            state.model.emotions,
          ),
          people: _getList(
            event.person ?? '',
            state.model.people,
          ),
          places: _getList(
            event.place ?? '',
            state.model.places,
          ),
          tags: _getList(
            event.tag ?? '',
            state.model.tags,
          ),
        ),
      ),
    );
  }

  void _onInitialValuesEvent(
    InitialValuesEvent event,
    Emitter<State> emit,
  ) {
    emit(
      FormChangedState(state.model.copyWith(
        date: event.date,
        clarity: event.clarity,
        dreamTypes: event.dreamTypes,
        emotions: event.emotions,
        people: event.people,
        places: event.places,
        tags: event.tags,
      )),
    );
  }

  List<String> _getList(
    String item,
    List<String> items,
  ) {
    if (item.isNotEmpty) {
      List<String> newList = List.from(items);

      if (newList.contains(item)) {
        newList = newList.where((i) => i != item).toList();
      } else {
        newList = [item, ...newList];
      }

      return newList;
    }
    return items;
  }
}
