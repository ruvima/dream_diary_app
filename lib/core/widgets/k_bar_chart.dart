import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class KBarChart extends StatelessWidget {
  const KBarChart({
    super.key,
    required this.ordinalData,
  });

  final List<OrdinalData> ordinalData;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: ordinalData.length >= 9 ? 1 : 2.4,
      child: ClipRRect(
        child: DChartBarO(
          animate: true,
          vertical: false,
          barLabelDecorator: BarLabelDecorator(
            barLabelPosition: BarLabelPosition.outside,
            labelAnchor: BarLabelAnchor.start,
            labelPadding: 6,
          ),
          barLabelValue: (bardata, child, index) {
            // return bardata.data[index ?? 0].measure.toInt().toString();
            return '';
          },
          layoutMargin: LayoutMargin(120, 10, 30, 30),
          groupList: [
            OrdinalGroup(
              id: '1',
              data: ordinalData,
              color: colors.primary,
            ),
          ],
          configRenderBar: ConfigRenderBar(
            radius: 8,
          ),
          outsideBarLabelStyle: (ordinalGroup, ordinalData, index) {
            return LabelStyle(color: colors.onBackground);
          },
          domainAxis: DomainAxis(
            labelStyle: LabelStyle(
              color: colors.onBackground,
            ),
          ),
          measureAxis: MeasureAxis(
            labelStyle: LabelStyle(color: colors.onBackground),
          ),
        ),
      ),
    );
  }
}
