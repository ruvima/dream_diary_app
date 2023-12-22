import 'package:flutter/material.dart';

import '../../core.dart';

class ErrorScaffold extends StatelessWidget {
  final String message;

  const ErrorScaffold({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: KTextLarge(message),
      ),
    );
  }
}
