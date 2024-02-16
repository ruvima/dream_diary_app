import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';

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
    final colors = Theme.of(context).colorScheme;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: colors.background,
        systemNavigationBarColor: colors.background,
      ),
      child: Material(
        color: colors.background,
        child: const SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: KLogo(
                    size: 94,
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 50,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: KTextLarge(
                    'v1.0.0 b1 ',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
