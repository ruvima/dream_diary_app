import 'package:flutter/material.dart';

import '../core.dart';

class KLogo extends StatelessWidget {
  const KLogo({super.key, this.size = 220});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: Container(
        padding: const EdgeInsets.all(TextSize.s32),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          KAssets.logo,
          fit: BoxFit.cover,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
