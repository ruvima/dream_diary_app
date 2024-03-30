part of '../screens/analysis_screen.dart';

class _TimeSelector extends StatelessWidget {
  const _TimeSelector();

  @override
  Widget build(BuildContext context) {
    final languageCode =
        Modular.get<prefs_bloc.PreferencesBloc>().state.model.languageCode;
    final ranges = TimeRange.values
        .map(
          (e) => languageCode == 'es' ? e.nameEs : e.nameEn,
        )
        .toList();

    return KButtonMultipleOp(
      ranges: ranges,
      onChanged: (i) {
        context.read<time_range.TimeRangeBloc>().add(
              time_range.ChangeTimeRangeEvent(
                timeRange: TimeRange.values[i],
              ),
            );
      },
    );
  }
}
