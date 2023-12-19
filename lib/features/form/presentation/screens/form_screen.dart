import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../../../../core/helper/form_mixin.dart';
import '../blocs/form/bloc.dart' as form_bloc;
import '../widgets/user_selected_list.dart';
import 'select_screen.dart';

part '../widgets/base_container.dart';
part '../widgets/items_box.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: _FormView(),
    );
  }
}

class _FormView extends StatelessWidget {
  const _FormView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<form_bloc.FormBloc, form_bloc.State>(
      bloc: Modular.get<form_bloc.FormBloc>(),
      builder: (_, state) {
        final model = state.model;
        return _BaseContainer(
          topWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Date(model.date),
              const Spacer(),
              const _SaveButton(),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KTextMedium(UiValues.dreamTitleLabel,
                  fontWeight: FontWeight.w600),
              gapH4,
              const _TitleFormField(),
              gapH12,
              KTextMedium(UiValues.dreamDescriptionLabel,
                  fontWeight: FontWeight.w600),
              gapH4,
              const _DescriptionFormField(),
              gapH12,
              KTextMedium(UiValues.dreamTitleLabel,
                  fontWeight: FontWeight.w600),
              gapH4,
              _DreamTypes(model.dreamTypes),
              gapH4,
              KTextMedium(
                UiValues.dreamClarityLabel,
                fontWeight: FontWeight.w600,
              ),
              _Clarity(model.clarity),
              _ItemsBox(
                title: UiValues.emotionLabel,
                list: model.emotions,
                selectType: SelectType.emotion,
              ),
              gapH4,
              _ItemsBox(
                title: UiValues.peopleInDreamLabel,
                list: model.people,
                selectType: SelectType.people,
              ),
              gapH4,
              _ItemsBox(
                title: UiValues.tagsLabel,
                list: model.tags,
                selectType: SelectType.tags,
              ),
              gapH12,
            ],
          ),
        );
      },
    );
  }
}

class _Date extends StatelessWidget {
  const _Date(this.date);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return KInkwell(
      onTap: () => _datePicker(context),
      child: Padding(
        padding: const EdgeInsets.only(
          top: KSizes.p4,
          bottom: KSizes.p4,
          right: KSizes.p8,
          left: KSizes.p4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const KIcon(icon: Icons.calendar_month),
            gapW4,
            KTextLarge(
              DateFormatter.shortDate(date),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }

  FutureOr<void> _datePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1990, 1, 01),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      Modular.get<form_bloc.FormBloc>().add(
        form_bloc.DateChangedEvent(selectedDate),
      );
    }
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return KPrimaryButton(
      isSmall: true,
      onPressed: () {
        if (Form.of(context).validate()) {
          Modular.get<form_bloc.FormBloc>().add(form_bloc.FormSavedEvent());
          Modular.to.pop();
        }
      },
      height: 30,
      text: 'Guardar',
    );
  }
}

class _TitleFormField extends StatelessWidget with FormMixin {
  const _TitleFormField();

  @override
  Widget build(BuildContext context) {
    return KTextFormField(
      hint: UiValues.dreamTitleHint,
      onChanged: (title) {
        if (title.isNotEmpty) {
          Modular.get<form_bloc.FormBloc>().add(
            form_bloc.TitleChangedEvent(title.trim()),
          );
        }
      },
    );
  }
}

class _DescriptionFormField extends StatelessWidget with FormMixin {
  const _DescriptionFormField();

  @override
  Widget build(BuildContext context) {
    return KTextFormField(
      hint: UiValues.dreamDescriptionHint,
      maxLines: 8,
      onChanged: (desc) {
        if (desc.isNotEmpty) {
          Modular.get<form_bloc.FormBloc>().add(
            form_bloc.DescriptionChangedEvent(desc.trim()),
          );
        }
      },
      validator: notEmptyValidator,
    );
  }
}

class _DreamTypes extends StatelessWidget {
  const _DreamTypes(this.dreamTypes);

  final List<String> dreamTypes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          DreamType.values.length,
          (index) {
            final dreamType = DreamType.values[index];
            final selected = dreamTypes.contains(dreamType.dreamTypeName);
            return Padding(
              padding: const EdgeInsets.only(left: KSizes.p12),
              child: KFilterChip(
                selected: selected,
                label: dreamType.dreamTypeName,
                onSelected: (_) {
                  Modular.get<form_bloc.FormBloc>().add(
                    form_bloc.DreamTypesChangedEvent(dreamType.dreamTypeName),
                  );
                },
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class _Clarity extends StatelessWidget {
  const _Clarity(this.clarity);
  final double clarity;

  @override
  Widget build(BuildContext context) {
    final clarityPercent = '${(clarity * 100).toStringAsFixed(0)}%';

    return Row(
      children: [
        Expanded(
          child: KSlider(
            value: clarity,
            onChanged: (clarity) {
              Modular.get<form_bloc.FormBloc>().add(
                form_bloc.ClarityChangedEvent(clarity),
              );
            },
          ),
        ),
        KTextMedium(
          clarityPercent,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
