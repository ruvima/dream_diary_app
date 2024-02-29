import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../../../../core/shared/bloc/preferences/preferences_bloc.dart'
    as preference_bloc;

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocConsumer<preference_bloc.PreferencesBloc, preference_bloc.State>(
      bloc: Modular.get<preference_bloc.PreferencesBloc>(),
      listener: (context, state) {
        if (state is preference_bloc.LoadedState) {
          Modular.to.pushNamedAndRemoveUntil(
            Routes.home,
            (p0) => false,
          );
        }
      },
      builder: (_, state) {
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
      },
    );
  }
}
