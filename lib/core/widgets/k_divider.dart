import 'package:flutter/material.dart';

class KDivider extends StatelessWidget {
  const KDivider({
    super.key,
    this.vertical = false,
    this.thickness = 1,
    this.length,
    this.margin,
    this.color,
  });

  final bool vertical;
  final double thickness;
  final double? length;

  final Color? color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: vertical ? thickness : length ?? double.infinity,
      height: vertical ? length ?? 100 : thickness,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.3,
          color: color ?? Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
