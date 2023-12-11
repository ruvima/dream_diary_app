import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class KCard extends StatelessWidget {
  const KCard({
    super.key,
    required this.child,
    this.alignment,
  });
  final Widget child;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.all(Sizes.p12),
      margin: const EdgeInsets.all(Sizes.p12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.p12),
        ),
      ),
      child: child,
    );
  }
}
