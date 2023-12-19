import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../blocs/form/bloc.dart' as form_bloc;
import '../widgets/user_selected_list.dart';

enum SelectType {
  emotion,
  people,
  tags,
}

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key, required this.selectType});
  final SelectType selectType;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.background,
        title: _WriteCustomTextField(
          selectType: selectType,
        ),
      ),
      body: _SelectView(selectType),
    );
  }
}

class _SelectView extends StatelessWidget {
  const _SelectView(this.selectType);
  final SelectType selectType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<form_bloc.FormBloc, form_bloc.State>(
      bloc: Modular.get<form_bloc.FormBloc>(),
      builder: (context, state) {
        final model = state.model;
        final list = selectType == SelectType.emotion
            ? model.emotions
            : selectType == SelectType.people
                ? model.people
                : model.tags;

        final mockList = selectType == SelectType.emotion
            ? _commonEmotions
            : selectType == SelectType.people
                ? _commonPersons
                : _commonTags;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: TextSize.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KTextMedium(
                UiValues.yourEmotionsLabel,
                fontWeight: FontWeight.w600,
              ),
              gapH4,
              UserSelectedList(list: list),
              gapH16,
              KTextMedium(
                UiValues.suggestionsLabel,
                fontWeight: FontWeight.w600,
              ),
              gapH4,
              SizedBox(
                width: double.infinity,
                child: KWrap(
                  children: List.generate(
                    mockList.length,
                    (index) {
                      final item = mockList[index];
                      final selected = list.contains(item);

                      return KFilterChip(
                        label: item,
                        onSelected: (_) {
                          _updateFormBloc(selectType, item);
                        },
                        selected: selected,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WriteCustomTextField extends StatefulWidget {
  const _WriteCustomTextField({
    required this.selectType,
  });

  final SelectType selectType;

  @override
  State<_WriteCustomTextField> createState() => _WriteCustomTextFieldState();
}

class _WriteCustomTextFieldState extends State<_WriteCustomTextField> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final selectedType = widget.selectType == SelectType.emotion
        ? UiValues.feelingsHint
        : widget.selectType == SelectType.people
            ? UiValues.addPersonHint
            : UiValues.addTagHint;
    return SizedBox(
      height: 35,
      child: KTextFormField(
        controller: _textEditingController,
        hint: selectedType,
        contentPadding: const EdgeInsets.all(KSizes.p8),
        suffixIcon: KIconButton(
          icon: Icons.send_outlined,
          onPressed: () {
            final text = _textEditingController.text.trim();
            if (text.isNotEmpty) {
              _updateFormBloc(
                widget.selectType,
                text,
              );
              _textEditingController.clear();
            }
          },
          compact: true,
        ),
      ),
    );
  }
}

void _updateFormBloc(SelectType selectType, String item) {
  switch (selectType) {
    case SelectType.emotion:
      Modular.get<form_bloc.FormBloc>().add(
        form_bloc.EmotionsChangedEvent(item),
      );
      break;
    case SelectType.people:
      Modular.get<form_bloc.FormBloc>().add(
        form_bloc.PeopleChangedEvent(item),
      );
      break;
    case SelectType.tags:
      Modular.get<form_bloc.FormBloc>().add(
        form_bloc.TagsChangedEvent(item),
      );
      break;
    default:
      // Manejar cualquier otro caso si es necesario
      break;
  }
}

List<String> _commonEmotions = [
  'Feliz',
  'Emocionado',
  'Triste',
  'Asustado',
  'Sorprendido',
  'Confundido',
  'Enamorado',
  'Agradecido',
  'Esperanzado',
  'Ansioso',
  'Enojado',
  'Alegre',
  'En Paz',
  'Empático',
  'Curioso',
  'Calmado',
  'Culpable',
  'Avergonzado',
  'Admirado',
  'Abrumado',
];

List<String> _commonPersons = [
  'Amigos',
  'Familiares',
  'Desconocidos',
  'Figuras históricas',
  'Animales',
  'Monstruos',
  'Héroes',
  'Villanos',
  'Niños',
  'Ancianos',
  'Personajes de películas',
  'Seres míticos',
  'Extraterrestres',
  'Superhéroes',
  'Yo mismo',
  'Sherk',
];

List<String> _commonTags = [
  'Aventura',
  'Romance',
  'Misterio',
  'Fantasía',
  'Terror',
  'Ciencia ficción',
  'Viaje en el tiempo',
  'Naturaleza',
  'Magia',
  'Exploración',
  'Desafíos',
  'Logros',
  'Transformación',
  'Despedida',
  'Reencuentro',
];
