import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: KSizes.p12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              gapH32,
              const Center(
                child: KLogo(),
              ),
              gapH24,
              KTextSmall(
                UiValues.emailLabel,
                fontWeight: FontWeight.w600,
              ),
              gapH4,
              KTextFormField(
                hint: UiValues.enterEmailHint,
              ),
              gapH16,
              KTextSmall(
                UiValues.passwordLabel,
                fontWeight: FontWeight.w600,
              ),
              gapH4,
              KTextFormField(hint: UiValues.enterPasswordHint),
              gapH32,
              KPrimaryButton(
                onPressed: () {
                  Modular.to.pushReplacementNamed(Routes.home);
                },
                width: double.infinity,
                text: UiValues.signIn,
              ),
              gapH48,
              KTextMedium(
                UiValues.signInWith,
                fontWeight: FontWeight.w600,
              ),
              gapH16,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _RegisterIcon(
                    logo: KAssets.googleLogo,
                  ),
                  _RegisterIcon(
                    logo: KAssets.facebookLogo,
                  ),
                ],
              ),
              gapH12,
              const Center(
                child: KDivider(
                  length: 150,
                ),
              ),
              gapH48,
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: KTextSmall(
                        UiValues.registerNow,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    KDivider(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5),
                      thickness: 0.2,
                      length: 150,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: KTextSmall(
                        UiValues.forgotPassword,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterIcon extends StatelessWidget {
  const _RegisterIcon({
    required this.logo,
  });
  final String logo;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: KSizes.p12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(KSizes.p12),
        color: colors.surface,
      ),
      width: 50,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(KSizes.p8),
        child: Image.asset(
          logo,
        ),
      ),
    );
  }
}
