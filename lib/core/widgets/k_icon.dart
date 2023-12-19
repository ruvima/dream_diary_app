import 'package:flutter/material.dart';

class KIcon extends StatelessWidget {
  const KIcon({
    super.key,
    required this.icon,
    this.size,
  });
  final IconData icon;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: Theme.of(context).colorScheme.primary,
      size: size,
    );
  }
}
