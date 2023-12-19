import 'package:flutter/material.dart';

class KIconButton extends StatelessWidget {
  const KIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.compact = false,
    this.padding,
    this.size,
  });
  final bool compact;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      padding: padding,
      visualDensity: compact
          ? const VisualDensity(horizontal: -2, vertical: -2)
          : VisualDensity.standard,
      icon: Icon(
        icon,
        size: size,
      ),
    );
  }
}
