import 'package:flutter/material.dart';

import '../core.dart';

class KWrap extends StatelessWidget {
  final List<Widget> children;
  final WrapAlignment alignment;
  const KWrap({
    super.key,
    required this.children,
    this.alignment = WrapAlignment.start,
  });
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: KSizes.p8,
      alignment: alignment,
      children: children,
    );
  }
}
