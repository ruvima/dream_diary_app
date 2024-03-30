part of '../screens/analysis_screen.dart';

class _BarChart extends StatelessWidget {
  const _BarChart({
    required this.ordinalData,
    required this.title,
  });
  final List<OrdinalData> ordinalData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return KCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: KSizes.p20,
              top: KSizes.p12,
            ),
            child: KTextLarge(
              title,
              fontWeight: FontWeight.w600,
            ),
          ),
          KBarChart(
            ordinalData: ordinalData,
          ),
        ],
      ),
    );
  }
}
