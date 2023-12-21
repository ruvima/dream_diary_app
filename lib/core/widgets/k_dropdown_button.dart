import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class KDropDownButton<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final Function(T?) onChanged;
  final T value;

  const KDropDownButton({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      borderRadius: BorderRadius.circular(KSizes.p12),
      underline: const SizedBox.shrink(),
      value: value,
      onChanged: onChanged,
      items: items,
    );
  }
}
