import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class KModernCard extends StatelessWidget {
  const KModernCard({
    super.key,
    this.width,
    this.height,
    this.color,
    required this.child,
  });

  final double? width;
  final double? height;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final borderadius = BorderRadius.circular(KSizes.p16);
    final colors = Theme.of(context).colorScheme;
    return Material(
      borderRadius: borderadius,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: colors.primary,
              blurRadius: 0.5,
              offset: const Offset(0, 0.2),
            )
          ],
          borderRadius: borderadius,
          border: Border.all(
            color: colors.onSurface.withOpacity(0.05),
          ),
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.centerRight,
            stops: const [0.85, 0.85],
            colors: [
              colors.surface,
              colors.primary,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
