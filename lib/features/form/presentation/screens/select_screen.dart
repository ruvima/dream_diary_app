import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../../../../core/shared/bloc/preferences/preferences_bloc.dart'
    as pref_bloc;
import '../blocs/form/bloc.dart' as form_bloc;
import '../blocs/suggestions/bloc.dart' as suggestions_bloc;
import '../widgets/user_selected_list.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key, required this.selectType});
  final SelectType selectType;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => suggestions_bloc.SuggestionsBloc()
        ..add(
          suggestions_bloc.GetSuggestions(selectType),
        ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colors.background,
          title: _WriteCustomTextField(
            selectType: selectType,
          ),
        ),
        body: _SelectView(selectType),
      ),
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
              UserSelectedList(
                list: list,
                selectType: selectType,
              ),
              gapH16,
              KTextMedium(
                UiValues.suggestionsLabel,
                fontWeight: FontWeight.w600,
              ),
              gapH4,
              _Sugestions(
                list: list,
                selectType: selectType,
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

class _Sugestions extends StatelessWidget {
  const _Sugestions({
    required this.list,
    required this.selectType,
  });

  final List<String> list;
  final SelectType selectType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<suggestions_bloc.SuggestionsBloc,
        suggestions_bloc.State>(
      builder: (_, state) {
        final code =
            Modular.get<pref_bloc.PreferencesBloc>().state.model.languageCode;
        final suggestions = state.model.getSuggestions(code);
        return SizedBox(
          width: double.infinity,
          child: KWrap(
            children: List.generate(
              suggestions.length,
              (index) {
                final item = suggestions[index];
                final selected = list.contains(item);

                return KFilterChip(
                  label: item,
                  onSelected: (selected) {
                    _updateFormBloc(selectType, item);
                  },
                  selected: selected,
                );
              },
            ),
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
