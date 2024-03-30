part of '../screens/analysis_screen.dart';

class _HeatMap extends StatelessWidget {
  const _HeatMap({
    required this.dates,
    required this.startDate,
  });
  final Map<DateTime, int> dates;
  final DateTime startDate;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return KCard(
      child: Padding(
        padding: const EdgeInsets.all(KSizes.p12),
        child: HeatMap(
          scrollable: true,
          colorMode: ColorMode.opacity,
          startDate: startDate,
          endDate: DateTime.now().add(
            const Duration(days: 2),
          ),
          datasets: dates,
          colorsets: {
            1: colors.primary,
          },
        ),
      ),
    );
  }
}
