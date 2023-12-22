import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/shared/domain/domain.dart';
import '../../../../core/core.dart';
import '../../blocs/dream/bloc.dart' as dream_bloc;

part '../widgets/dream_card.dart';
part '../widgets/dream_card_skeleton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _DreamsView();
  }
}

class _DreamsView extends StatelessWidget {
  const _DreamsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<dream_bloc.DreamBloc, dream_bloc.State>(
      bloc: Modular.get<dream_bloc.DreamBloc>(),
      builder: (context, state) {
        final model = state.model;

        if (state is dream_bloc.ErrorState) {
          return ErrorBody(message: state.model.error);
        }
        if (state is dream_bloc.LoadingState) {
          return const _DreamCardSkeleton();
        }
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const _Appbar(),
            SliverList.builder(
              itemCount: model.dreams.length,
              itemBuilder: (_, index) {
                final dream = model.dreams[index];
                final prevDream = index > 0 ? model.dreams[index - 1] : null;

                final showMonth = shouldShowMonth(dream.date, prevDream?.date);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: KSizes.p16)
                      .copyWith(
                    bottom: KSizes.p16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showMonth)
                        KHeadline6(
                          DateFormatter.modularMonth(dream.date),
                        ),
                      DreamCard(dream: dream),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  bool shouldShowMonth(DateTime current, DateTime? previous) {
    return current.month != previous?.month || current.year != previous?.year;
  }
}

class _Appbar extends StatelessWidget {
  const _Appbar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: KHeadline4(UiValues.myDreams),
      actions: [
        KIconButton(
          onPressed: () {
            Modular.get<dream_bloc.DreamBloc>().add(
              dream_bloc.LoadDreamsEvent(),
            );
          },
          icon: Icons.search,
        ),
      ],
    );
  }
}
