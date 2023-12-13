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
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.all(KSizes.p12),
      margin: const EdgeInsets.all(KSizes.p12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
        borderRadius: const BorderRadius.all(
          Radius.circular(KSizes.p12),
        ),
      ),
      child: child,
    );
  }
}
