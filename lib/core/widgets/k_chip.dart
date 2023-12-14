import 'package:flutter/material.dart';

import '../core.dart';

class KChip extends StatelessWidget {
  final String label;
  final bool compact;
  final Color? color;
  final Function()? onDeleted;
  const KChip({
    super.key,
    required this.label,
    this.compact = false,
    this.color,
    this.onDeleted,
  });
  @override
  Widget build(BuildContext context) {
    return Chip(
      onDeleted: onDeleted,
      label: compact
          ? KTextSmall(
              label,
              fontWeight: FontWeight.w500,
            )
          : KTextMedium(label),
      padding: EdgeInsets.zero,
      side: BorderSide.none,
      visualDensity: compact
          ? const VisualDensity(horizontal: -4, vertical: -4)
          : VisualDensity.standard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(KSizes.p12),
      ),
      color: MaterialStatePropertyAll(
        color ?? Theme.of(context).colorScheme.background,
      ),
      deleteButtonTooltipMessage: '',
    );
  }
}
