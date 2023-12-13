import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../blocs/dream/bloc.dart' as dream;
import '../domain/domain.dart';
import '../widgets/dream_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dreamRepository = Modular.get<DreamRepository>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => dream.DreamBloc(
            dreamRepository: dreamRepository,
          )..add(dream.LoadDreamsEvent()),
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
    return BlocBuilder<dream.DreamBloc, dream.State>(
      builder: (context, state) {
        final model = state.model;

        if (state is dream.ErrorState) {
          return Center(
            child: Text(state.model.error),
          );
        }
        if (state is dream.LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomScrollView(
          slivers: [
            const _Appbar(),
            SliverList.builder(
              itemCount: model.dreams.length,
              itemBuilder: (_, i) {
                return DreamCard(
                  dream: model.dreams[i],
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
