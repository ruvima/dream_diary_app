import 'package:flutter/material.dart';

class KInkwell extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double borderRadius;
  const KInkwell({
    super.key,
    required this.onTap,
    required this.child,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      splashColor: Theme.of(context).colorScheme.primary,
      highlightColor: Theme.of(context).colorScheme.primary,
      onTap: onTap,
      child: child,
    );
  }
}