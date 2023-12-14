import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core.dart';

class KModalContainer extends StatelessWidget {
  const KModalContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(14.0),
        topRight: Radius.circular(14.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(KSizes.p12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.close),
              onPressed: () {
                Modular.to.pop();
              },
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: KSizes.p16,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
