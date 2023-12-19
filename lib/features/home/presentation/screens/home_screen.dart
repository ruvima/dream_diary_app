import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/shared/domain/domain.dart';
import '../../../../core/core.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../blocs/dream/bloc.dart' as dream_bloc;

part '../widgets/dream_card.dart';
part '../widgets/dream_card_skeleton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final localStorageRepository = Modular.get<LocalStorageRepository>();
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
          return Center(
            child: Text(state.model.error),
          );
        }
        if (state is dream_bloc.LoadingState) {
          return const _DreamCardSkeleton();
        }
        return CustomScrollView(
          slivers: [
            const _Appbar(),
            SliverList.builder(
              itemCount: model.dreams.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(KSizes.p12),
                  child: DreamCard(
                    dream: model.dreams[i],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class _Appbar extends StatelessWidget {
  const _Appbar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      backgroundColor: Theme.of(context).colorScheme.background,
      centerTitle: true,
      title: Text(UiValues.myDreams),
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
