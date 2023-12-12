import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/screens/search_screen.dart';

class SearchModule extends Module {
  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const SearchScreen(),
    );
  }
}
