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
      color: Colors.transparent,
      borderRadius: borderadius,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderadius,
          border: Border.all(
            color: colors.onSurface.withOpacity(0.05),
          ),
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.centerRight,
            stops: const [0.85, 0.85],
            colors: [
              colors.surface.withOpacity(0.7),
              colors.primary,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
