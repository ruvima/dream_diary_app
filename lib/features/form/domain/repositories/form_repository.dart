import '../../../../core/shared/domain/domain.dart';

abstract class FormRepository {
  Future<void> create(DreamEntity dream);

  Future<void> update(DreamEntity dream);
}
