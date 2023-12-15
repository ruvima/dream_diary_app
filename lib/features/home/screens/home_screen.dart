import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/core.dart';
import '../../../core/widgets/k_chip.dart';
import '../blocs/dream/bloc.dart' as dream_bloc;
import '../domain/domain.dart';

part '../widgets/dream_card.dart';
part '../widgets/dream_card_skeleton.dart';
part '../widgets/dream_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dreamRepository = Modular.get<DreamRepository>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => dream_bloc.DreamBloc(
            dreamRepository: dreamRepository,
          )..add(dream_bloc.LoadDreamsEvent()),
        ),
      ],
      child: const _DreamsView(),
    );
  }
}

class _DreamsView extends StatelessWidget {
  const _DreamsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<dream_bloc.DreamBloc, dream_bloc.State>(
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
      title: const Text('My Dreams'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
