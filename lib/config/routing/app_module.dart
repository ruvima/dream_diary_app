import 'package:flutter_modular/flutter_modular.dart';

import '../../core/shared/bloc/preferences/preferences_bloc.dart'
    as preferences_bloc;
import '../../core/shared/local/isar_db/local_db.dart';
import '../../core/shared/local/isar_db/local_db_impl.dart';
import '../../core/shared/local/shared_pref/key_value_storage_service.dart';
import '../../core/shared/local/shared_pref/key_value_storage_service_impl.dart';
import '../../features/auth/module.dart';
import '../../features/home/module.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/tutorial/module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<LocalDb>(() => IsarDB());
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
