import 'package:flutter/material.dart';

import '../core.dart';

class KCard extends StatelessWidget {
  const KCard({
    super.key,
    required this.child,
    this.alignment,
    this.color,
  });
  final AlignmentGeometry? alignment;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Theme.of(context).colorScheme.surface,
      borderRadius: const BorderRadius.all(
        Radius.circular(KSizes.p16),
      ),
      child: child,
    );
  }
}
