import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../blocs/form/bloc.dart' as form_bloc;

class UserSelectedList extends StatelessWidget {
  const UserSelectedList({
    super.key,
    required this.list,
  });

  final List<String> list;

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
            onSelected: (_) {
              Modular.get<form_bloc.FormBloc>().add(
                form_bloc.EmotionsChangedEvent(item),
              );
            },
            selected: selected,
          );
        },
      ),
    );
  }
}
