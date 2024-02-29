import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../blocs/form/bloc.dart' as form_bloc;

class UserSelectedList extends StatelessWidget {
  const UserSelectedList({
    super.key,
    required this.list,
    required this.selectType,
  });

  final List<String> list;
  final SelectType selectType;
  @override
  Widget build(BuildContext context) {
    return KWrap(
      children: List.generate(
        list.length,
        (index) {
          final item = list[index];
          final selected = list.contains(item);

          return KFilterChip(
            label: item,
            onSelected: (_) => _updateFormBloc(selectType, item),
            selected: selected,
          );
        },
      ),
    );
  }

  void _updateFormBloc(SelectType selectType, String item) {
    switch (selectType) {
      case SelectType.emotion:
        Modular.get<form_bloc.FormBloc>().add(
          form_bloc.EditFormEvent(emotion: item),
        );
        break;
      case SelectType.people:
        Modular.get<form_bloc.FormBloc>().add(
          form_bloc.EditFormEvent(person: item),
        );
        break;
      case SelectType.places:
        Modular.get<form_bloc.FormBloc>().add(
          form_bloc.EditFormEvent(place: item),
        );
        break;
      case SelectType.tags:
        Modular.get<form_bloc.FormBloc>().add(
          form_bloc.EditFormEvent(tag: item),
        );
        break;
      default:
        break;
    }
  }
}
