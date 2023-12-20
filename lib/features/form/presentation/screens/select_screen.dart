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
  places,
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

        final list = _getList(selectType, model);

        final mockList = _getSuggestions(selectType);

        final label = _getLabel(selectType);

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: TextSize.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KTextMedium(
                label,
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

  List<String> _getList(SelectType type, form_bloc.Model model) {
    switch (type) {
      case SelectType.emotion:
        return model.emotions;
      case SelectType.people:
        return model.people;
      case SelectType.places:
        return model.places;
      default:
        return model.tags;
    }
  }

  List<String> _getSuggestions(SelectType type) {
    switch (type) {
      case SelectType.emotion:
        return _commonEmotions;
      case SelectType.people:
        return _commonPersons;
      case SelectType.places:
        return _commonPlaces;
      default:
        return _commonTags;
    }
  }

  String _getLabel(SelectType type) {
    switch (type) {
      case SelectType.emotion:
        return UiValues.emotionLabel;
      case SelectType.people:
        return UiValues.peopleInDreamLabel;
      case SelectType.places:
        return UiValues.placesLabel;
      default:
        return UiValues.tagsLabel;
    }
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
    case SelectType.places:
      Modular.get<form_bloc.FormBloc>().add(
        form_bloc.PlaceChangedEvent(item),
      );
      break;
    case SelectType.tags:
      Modular.get<form_bloc.FormBloc>().add(
        form_bloc.TagsChangedEvent(item),
      );
      break;
    default:
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
List<String> _commonPlaces = [
  'Casa familiar',
  'Trabajo o escuela',
  'Calles familiares',
  'Playa',
  'Montañas',
  'Parque',
  'Centro comercial',
  'Bosque',
  'Aeropuerto',
  'Restaurante',
  'Estadio o auditorio',
  'Hospital',
  'Cielo estrellado',
  'Estación de tren',
  'Ciudad',
];
