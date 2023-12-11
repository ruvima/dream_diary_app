import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../widgets/dream_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const DreamCard();
        },
      ),
    );
  }
}
