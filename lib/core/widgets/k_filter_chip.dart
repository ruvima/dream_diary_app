import 'package:flutter/material.dart';

import 'text_widgets.dart';

class KFilterChip extends StatelessWidget {
  const KFilterChip({
    super.key,
    required this.label,
    required this.onSelected,
    required this.selected,
  });
  final Function(bool)? onSelected;
  final String label;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      showCheckmark: false,
      selected: selected,
      padding: EdgeInsets.zero,
      backgroundColor: Theme.of(context).colorScheme.surface,
      label: KTextMedium(label),
      onSelected: onSelected,
      visualDensity: VisualDensity.comfortable,
    );
  }
}
