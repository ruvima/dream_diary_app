import '../../domain/domain.dart';
import '../../domain/entities/dream_entity.dart';

class DreamDatasourceImpl extends DreamDatasource {
  @override
  Future<List<DreamEntity>> fetchDreams() async {
    //TODO: HANDLE EXCEPTIONS
    await Future.delayed(const Duration(seconds: 1));
    return [
      DreamEntity(
        clarity: DreamClarity.unclear,
        date: DateTime.now(),
        description: 'description',
        dreamTypes: [DreamType.nightmare],
        emotion: Emotion.neutral,
        id: ' 1',
        people: ['people'],
        tags: ['tags'],
        title: 'title',
      )
    ];
  }
}
