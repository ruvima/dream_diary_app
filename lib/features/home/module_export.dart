import 'package:flutter_modular/flutter_modular.dart';

import '../../core/shared/local/isar_db/local_db.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'domain/entities/dream_entity.dart';

class HomeModuleExport extends Module {
  @override
  void binds(Injector i) async {
    i.addLazySingleton<IDreamsRepository>(
      () {
        final db = i.get<LocalDb>().initDb([DreamEntitySchema]);
        i.get<LocalDb>().setDB(db);
        return DreamRepositoryImpl(
          datasource: LocalDatasourceImpl(
            localDb: i.get<LocalDb>(),
          ),
        );
      },
    );
    i.addLazySingleton<GetDreamsUsecase>(
      () => GetDreamsUsecase(
        iIDreamsRepository: i.get<IDreamsRepository>(),
      ),
    );
    i.addLazySingleton<DeleteDreamUsecase>(
      () => DeleteDreamUsecase(
        iIDreamsRepository: i.get<IDreamsRepository>(),
      ),
    );
    i.addLazySingleton<CreateDreamUsecase>(
      () => CreateDreamUsecase(
        iIDreamsRepository: i.get<IDreamsRepository>(),
      ),
    );
    i.addLazySingleton<UpdateDreamUsecase>(
      () => UpdateDreamUsecase(
        iIDreamsRepository: i.get<IDreamsRepository>(),
      ),
    );
    i.addLazySingleton<GetFilteredDreamsUsecase>(
      () => GetFilteredDreamsUsecase(
        iIDreamsRepository: i.get<IDreamsRepository>(),
      ),
    );
  }
}
