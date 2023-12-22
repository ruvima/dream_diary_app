import 'package:flutter/material.dart';

import '../../core.dart';

class ErrorBody extends StatelessWidget {
  final String message;

  const ErrorBody({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: KTextLarge(message),
    );
  }
}
