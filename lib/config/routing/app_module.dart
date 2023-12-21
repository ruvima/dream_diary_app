import 'package:flutter_modular/flutter_modular.dart';

import '../../core/shared/data/services/key_value_storage_service.dart';
import '../../core/shared/data/services/key_value_storage_service_impl.dart';
import '../../core/shared/presentation/bloc/preferences/preferences_bloc.dart'
    as preferences_bloc;
import '../../features/auth/module.dart';
import '../../features/home/module.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/tutorial/module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<KeyValueStorageService>(
      () => KeyValueStorageServiceImpl(),
    );
    i.addSingleton<preferences_bloc.PreferencesBloc>(
      () => preferences_bloc.PreferencesBloc(
        keyValueStorageService: i.get<KeyValueStorageService>(),
      )..add(
          preferences_bloc.LoadingPrefsEvent(),
        ),
    );
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (_) => const SplashScreen(),
    );
    r.module('/tutorial', module: TutorialModule());
    r.module('/auth', module: AuthModule());
    r.module('/home', module: HomeModule());
  }
}
