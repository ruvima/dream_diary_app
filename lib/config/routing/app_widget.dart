import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/shared/bloc/preferences/preferences_bloc.dart'
    as preferences_bloc;
import '../../generated/l10n.dart';
import '../theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<preferences_bloc.PreferencesBloc>();
    return BlocBuilder<preferences_bloc.PreferencesBloc,
        preferences_bloc.State>(
      bloc: bloc,
      // buildWhen: (_, state) => state is preferences_bloc.PreferenceChangeState,
      builder: (context, state) {
        final model = state.model;
        print(model.languageCode);
        return MaterialApp.router(
          title: 'Dream Diary App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: model.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          routerConfig: Modular.routerConfig,
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          locale: Locale(model.languageCode),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
