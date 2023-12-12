import 'package:flutter/material.dart';

import '../widgets/dream_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            backgroundColor: Theme.of(context).colorScheme.background,
            centerTitle: true,
            title: const Text('My Dreams'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const DreamCard();
            },
          ),
        ],
      ),
    );
  }
}
