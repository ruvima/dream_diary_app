part of '../screens/analysis_screen.dart';

class _PieChart extends StatelessWidget {
  const _PieChart(this.ordinalDataList);
  final List<OrdinalData> ordinalDataList;

  @override
  Widget build(BuildContext context) {
    final languageCode =
        Modular.get<prefs_bloc.PreferencesBloc>().state.model.languageCode;
    return KCard(
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: KPieChart(
              ordinalDataList: ordinalDataList,
            ),
          ),
          KWrap(
            children: List.generate(
              DreamType.values.length,
              (i) {
                final dreamTypes = DreamType.values[i];
                return _Indicator(
                  color: dreamTypes.color,
                  text: languageCode == 'es'
                      ? dreamTypes.nameEs
                      : dreamTypes.nameEn,
                );
              },
            ),
          ),
          gapH8
        ],
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    required this.color,
    required this.text,
  });
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
          gapW4,
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: colors.onBackground,
            ),
          )
        ],
      ),
    );
  }
}
