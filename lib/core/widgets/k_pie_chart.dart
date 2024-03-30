import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class KPieChart extends StatelessWidget {
  const KPieChart({super.key, required this.ordinalDataList});
  final List<OrdinalData> ordinalDataList;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: DChartPieO(
        customLabel: (ordinalData, index) {
          return '${ordinalData.measure}%';
        },
        animate: true,
        data: ordinalDataList,
        configRenderPie: ConfigRenderPie(
          arcLabelDecorator: ArcLabelDecorator(
            labelPosition: ArcLabelPosition.inside,
            insideLabelStyle: LabelStyle(
              color: colors.onBackground,
              fontSize: 16,
            ),
            outsideLabelStyle: LabelStyle(
              color: colors.onBackground,
              fontSize: 14,
            ),
            labelPadding: 10,
            leaderLineStyle: const ArcLabelLeaderLineStyle(
              color: Colors.blue,
              length: 30,
              thickness: 2,
            ),
            showLeaderLines: true,
          ),
        ),
      ),
    );
  }
}
