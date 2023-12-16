import 'package:flutter/material.dart';

class KIconButton extends StatelessWidget {
  const KIconButton({
    super.key,
    required this.icon,
    this.compact = false,
    required this.onPressed,
  });
  final IconData icon;
  final bool compact;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      visualDensity: compact
          ? const VisualDensity(horizontal: -2, vertical: -2)
          : VisualDensity.standard,
      icon: Icon(icon),
    );
  }
}
