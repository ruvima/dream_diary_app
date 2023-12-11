import 'package:flutter/material.dart';

class KDivider extends StatelessWidget {
  const KDivider({
    super.key,
    this.vertical = false,
    this.height = 100,
    this.width = 2,
  });
  final bool vertical;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: vertical ? width : double.infinity,
      height: vertical ? height : width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onTertiary.withOpacity(0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
