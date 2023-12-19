import 'package:flutter/material.dart';

import '../core.dart';

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
    return Material(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: const BorderRadius.all(
        Radius.circular(KSizes.p12),
      ),
      child: child,
    );
  }
}
