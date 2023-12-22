import 'package:flutter/material.dart';

class CircularProgressScaffold extends StatelessWidget {
  const CircularProgressScaffold({
    super.key,
    this.strokeWidth = 3,
    this.color,
  });

  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
