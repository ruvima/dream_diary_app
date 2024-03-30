import 'package:d_chart/d_chart.dart';

class OrdinalDataModel extends OrdinalData {
  OrdinalDataModel({
    required super.domain,
    required super.measure,
    super.color,
  });

  factory OrdinalDataModel.fromMap(MapEntry<String, double> entry) {
    return OrdinalDataModel(
      domain: entry.key,
      measure: entry.value,
    );
  }

  static List<OrdinalData> toList(Map<String, double> dataMap) {
    return dataMap.entries
        .map(
          (e) => OrdinalDataModel.fromMap(e),
        )
        .toList();
  }
}
