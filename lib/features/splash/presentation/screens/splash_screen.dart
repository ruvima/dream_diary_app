import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/constants/routes.dart';
import '../../../../core/constants/ui_values.dart';
import '../../../../l10n/string_hardcoded.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _validAutorization();
    super.initState();
  }

  Future<void> _validAutorization() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    Modular.to.pushNamedAndRemoveUntil(
      Routes.auth,
      (p0) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            Image.asset(
              UiValues.logo,
              fit: BoxFit.cover,
              color: Theme.of(context).colorScheme.primary,
              width: 250,
            ),
            Text(
              'v1.0.0'.hardcoded,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
