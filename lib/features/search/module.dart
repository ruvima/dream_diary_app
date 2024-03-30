import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/blocs/calendar/bloc.dart' as calendar_bloc;
import 'presentation/screens/search_screen.dart';

class SearchModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<calendar_bloc.CalendarBloc>(
      () => calendar_bloc.CalendarBloc(),
    );
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const SearchScreen(),
    );
  }
}
