import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class KGlassCard extends StatelessWidget {
  const KGlassCard({
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
    return ClipRRect(
      borderRadius: borderadius,
      child: Material(
        color: color ?? colors.error.withOpacity(0.2),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4.0,
            sigmaY: 4.0,
          ),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: borderadius,
              border: Border.all(
                color: colors.onSurface.withOpacity(0.05),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colors.secondaryContainer.withOpacity(0.15),
                  colors.secondaryContainer.withOpacity(0.05),
                ],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
