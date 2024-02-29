import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../../../../core/shared/bloc/preferences/preferences_bloc.dart'
    as preferences_bloc;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Modular.get<preferences_bloc.PreferencesBloc>();

    return BlocBuilder<preferences_bloc.PreferencesBloc,
        preferences_bloc.State>(
      bloc: bloc,
      buildWhen: (_, state) => state is preferences_bloc.LoadedState,
      builder: (context, state) {
        final model = state.model;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: KSizes.p16),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KHeadline4(UiValues.settingsLabel),
                gapH16,
                _SettingItem(
                  label: UiValues.darkModeLabel,
                  icon: Icons.nightlight,
                  child: Switch(
                    value: model.isDarkMode,
                    onChanged: (isDarkMode) {
                      Modular.get<preferences_bloc.PreferencesBloc>().add(
                        preferences_bloc.ThemeModeChangedEvent(isDarkMode),
                      );
                    },
                  ),
                ),
                gapH16,
                _SettingItem(
                  label: UiValues.languageLabel,
                  icon: Icons.language,
                  child: KDropDownButton<String>(
                    value: model.languageCode,
                    onChanged: (language) {
                      if (language != null) {
                        Modular.get<preferences_bloc.PreferencesBloc>().add(
                          preferences_bloc.LanguageChangedEvent(language),
                        );
                      }
                    },
                    items: List.generate(
                      LanguageCode.values.length,
                      (i) {
                        final language = LanguageCode.values[i];
                        return DropdownMenuItem(
                          value: language.languageCode,
                          child: KTextLarge(
                            language == LanguageCode.spanish
                                ? UiValues.spanish
                                : UiValues.english,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
                gapH16,
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SettingItem extends StatelessWidget {
  const _SettingItem({
    required this.child,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(KSizes.p4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(KSizes.p16),
        color: colors.surface,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: colors.background,
            child: KIcon(
              icon: icon,
            ),
          ),
          gapW16,
          Expanded(child: KTextLarge(label)),
          child,
        ],
      ),
    );
  }
}
