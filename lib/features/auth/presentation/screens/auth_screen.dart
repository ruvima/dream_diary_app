import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants/routes.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Modular.to.pushNamedAndRemoveUntil(
            Routes.home,
            (p0) => false,
          );
        },
        child: const Text('Home'),
      ),
    );
  }
}
