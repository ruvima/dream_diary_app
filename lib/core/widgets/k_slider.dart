import 'package:flutter/material.dart';

import '../core.dart';

class KSlider extends StatelessWidget {
  final double value;
  final Function(double)? onChanged;
  final double min;
  final double max;

  final Color? activeColor;
  final Color? inactiveColor;

  const KSlider({
    Key? key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.activeColor,
    this.inactiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final label = '${((value - min) / (max - min) * 10).round()}';

    return Slider(
      value: value,
      min: min,
      max: max,
      activeColor: Theme.of(context).colorScheme.primary,
      inactiveColor: AppColors.elegantBlue,
      onChanged: onChanged,
      divisions: 10,
      // label: label,
    );
  }
}
