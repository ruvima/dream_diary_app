import 'package:flutter/material.dart';

abstract class KModalBottomSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    Curve animationCurve = Curves.easeOut,
    int animationDuration = 500,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: false,
      builder: (context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          curve: animationCurve,
          duration: Duration(milliseconds: animationDuration),
          child: child,
        );
      },
    );
  }
}
