import 'package:flutter_modular/flutter_modular.dart';

import '../home/module_export.dart';
import 'presentation/screens/analysis_screen.dart';

class AnalysisModule extends Module {
  @override
  List<Module> get imports => [
        HomeModuleExport(),
      ];
  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const AnalysisScreen(),
    );
  }
}
