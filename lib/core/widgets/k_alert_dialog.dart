import 'package:flutter/material.dart';

import '../core.dart';

class KShowDialog {
  static Future<T?> alertDialog<T>(
    context, {
    required String title,
    required String content,
    required Function()? onCancel,
    required String textOnCancel,
    required Function()? onAcept,
    required String textOnAcept,
  }) {
    return KDialog.show(
      context,
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              KSizes.p16,
            ),
          ),
        ),
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: onCancel,
            child: Text(textOnCancel),
          ),
          TextButton(
            onPressed: onAcept,
            child: Text(textOnAcept),
          ),
        ],
      ),
    );
  }
}
