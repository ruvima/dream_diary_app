import 'package:flutter/material.dart';

class KIcon extends StatelessWidget {
  const KIcon({super.key, required this.icon, this.size, this.color});
  final IconData icon;
  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color ?? Theme.of(context).colorScheme.primary,
      size: size,
    );
  }
}
