import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: KSizes.p12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              const KTextSmall('Correo electrónico: '),
              gapH4,
              const KTextFormField(
                hint: 'Ingresa tu correo electrónico',
              ),
              gapH16,
              const KTextSmall('Contraseña: '),
              gapH4,
              const KTextFormField(hint: 'Ingresa tu contraseña'),
              gapH32,
              KPrimaryButton(
                onPressed: () {
                  Modular.to.pushReplacementNamed(Routes.home);
                },
                width: double.infinity,
                text: 'Iniciar Sesión',
              ),
              gapH64,
              const KTextMedium('Iniciar sesión con: '),
              gapH16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: KSizes.p12),
                    color: Colors.amber,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              gapH12,
              const Center(
                child: KDivider(
                  length: 150,
                ),
              ),
              gapH32,
              TextButton(
                onPressed: () {},
                child:
                    const Text('¿No tienes una cuenta aún? ¡Regístrate ahora!'),
              ),
              Center(
                child: KDivider(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  thickness: 0.2,
                  length: 150,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('¿Olvidaste tu contraseña?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
