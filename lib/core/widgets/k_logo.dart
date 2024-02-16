import 'package:flutter/material.dart';

import '../core.dart';

class KLogo extends StatelessWidget {
  const KLogo({super.key, this.size = 220});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: Image.asset(
        KAssets.logo,
        fit: BoxFit.cover,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
