import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;

import '../../../../core/core.dart';
import '../../../../core/helper/form_mixin.dart';
import '../../../home/domain/domain.dart';
import '../blocs/form/bloc.dart' as form_bloc;
import '../blocs/save/bloc.dart' as save_bloc;
import '../widgets/user_selected_list.dart';

part '../widgets/base_container.dart';
part '../widgets/items_box.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({
    super.key,
    this.dreamEntity,
  });

  final DreamEntity? dreamEntity;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: _FormView(dreamEntity),
    );
  }
}

class _FormView extends StatelessWidget {
  const _FormView(this.dreamEntity);
  final DreamEntity? dreamEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<form_bloc.FormBloc, form_bloc.State>(
      bloc: Modular.get<form_bloc.FormBloc>(),
      builder: (_, state) {
        final model = state.model;

        if (state is form_bloc.LoadingState) {
          return const CircularProgressScaffold();
        } else if (state is form_bloc.ErrorState) {
          return ErrorScaffold(message: state.model.error);
        }
        return _BaseContainer(
          topWidget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Date(model.date),
              const Spacer(),
              _SaveButton(
                disabled: false,
                dreamEntity: dreamEntity,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Label(UiValues.dreamTitleLabel),
              gapH4,
              const _TitleFormField(),
              gapH12,
              _Label(UiValues.dreamDescriptionLabel),
              gapH4,
              const _DescriptionFormField(),
              gapH12,
              _Label(UiValues.dreamTypeLabel),
              gapH4,
              _DreamTypes(model.dreamTypes),
              gapH4,
              _Label(UiValues.dreamClarityLabel),
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
                title: UiValues.placesLabel,
                list: model.places,
                selectType: SelectType.places,
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

class _Label extends StatelessWidget {
  const _Label(this.label);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: KSizes.p16,
      ),
      child: KTextMedium(
        label,
        fontWeight: FontWeight.w600,
      ),
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
        form_bloc.EditFormEvent(
          date: selectedDate,
        ),
      );
    }
  }
}

class _TitleFormField extends StatelessWidget with FormMixin {
  const _TitleFormField();

  @override
  Widget build(BuildContext context) {
    final readFormBloc = Modular.get<form_bloc.FormBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KSizes.p16),
      child: KTextFormField(
        controller: readFormBloc.titleController,
        hint: UiValues.dreamTitleHint,
      ),
    );
  }
}

class _DescriptionFormField extends StatelessWidget with FormMixin {
  const _DescriptionFormField();

  @override
  Widget build(BuildContext context) {
    final readFormBloc = Modular.get<form_bloc.FormBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KSizes.p16),
      child: KTextFormField(
        controller: readFormBloc.descController,
        hint: UiValues.dreamDescriptionHint,
        maxLines: 8,
        validator: notEmptyValidator,
      ),
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
                    form_bloc.EditFormEvent(
                      dreamType: dreamType.dreamTypeName,
                    ),
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
                form_bloc.EditFormEvent(
                  clarity: clarity,
                ),
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

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    required this.disabled,
    required this.dreamEntity,
  });
  final bool disabled;
  final DreamEntity? dreamEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => save_bloc.SaveDreamBloc(),
      child: Builder(builder: (context) {
        return BlocListener<save_bloc.SaveDreamBloc, save_bloc.State>(
          listener: (context, state) {
            if (state is save_bloc.LoadedState) {
              final dream = getDreamEntity();
              Modular.to.pop(dream);
            }
          },
          child: KPrimaryButton(
            isSmall: true,
            onPressed: disabled
                ? null
                : () {
                    if (Form.of(context).validate()) {
                      final dream = getDreamEntity();
                      context.read<save_bloc.SaveDreamBloc>().add(
                            save_bloc.FormSavedEvent(
                              dreamEntity: dream,
                              formType: dreamEntity != null
                                  ? FormType.edit
                                  : FormType.create,
                            ),
                          );
                    }
                  },
            height: 30,
            text: 'Guardar',
          ),
        );
      }),
    );
  }

  DreamEntity getDreamEntity() {
    final readFormBloc = Modular.get<form_bloc.FormBloc>();
    final form = readFormBloc.state.model;

    return DreamEntity(
      id: dreamEntity?.id,
      clarity: form.clarity,
      date: form.date,
      description: readFormBloc.description,
      dreamTypes: form.dreamTypes,
      emotions: form.emotions,
      people: form.people,
      places: form.places,
      tags: form.tags,
      title: readFormBloc.title,
    );
  }
}
