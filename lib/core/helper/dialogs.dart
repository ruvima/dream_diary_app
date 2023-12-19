import 'package:flutter/material.dart';

abstract class KDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
  }) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return child;
      },
    );
  }
}
