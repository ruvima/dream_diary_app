import 'package:flutter/material.dart';

import '../core.dart';

class KBottomSheetContainer extends StatelessWidget {
  const KBottomSheetContainer({
    super.key,
    required this.child,
    this.label,
  });

  final Widget child;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 0.3),
        KDivider(
          length: 100,
          color: Theme.of(context).colorScheme.primary,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  gapW4,
                  Expanded(
                    child: KHeadline6(
                      label ?? 'Laberinto Enigmatico',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton<int>(
              onSelected: (index) {},
              itemBuilder: (context) => [
                const PopupMenuItem<int>(value: 0, child: Text('Edita')),
                const PopupMenuItem<int>(value: 1, child: Text('Eliminar')),
              ],
            ),
          ],
        ),
        const KDivider(
          margin: EdgeInsets.symmetric(horizontal: KSizes.p12),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: KSizes.p12),
            child: child,
          ),
        ),
      ],
    );
  }
}
