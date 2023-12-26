import '../../../../core/shared/domain/domain.dart';

abstract class FormDatasource {
  Future<void> create(DreamEntity dream);

  Future<void> update(DreamEntity dream);
}
