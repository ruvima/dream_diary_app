import 'package:isar/isar.dart';

part 'dream_entity.g.dart';

@collection
class DreamEntity {
  Id? irarId;

  final DateTime date;
  final double clarity;
  final List<String> dreamTypes;
  final List<String> emotions;
  final List<String> people;
  final List<String> tags;
  final String description;
  final String id;
  final String title;
  DreamEntity({
    required this.clarity,
    required this.date,
    required this.description,
    required this.dreamTypes,
    required this.emotions,
    required this.id,
    required this.people,
    required this.tags,
    required this.title,
  });
}
