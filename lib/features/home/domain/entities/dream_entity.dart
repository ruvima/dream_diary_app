import 'package:isar/isar.dart';

part 'dream_entity.g.dart';

@collection
class DreamEntity {
  DreamEntity({
    required this.clarity,
    required this.date,
    required this.description,
    required this.dreamTypes,
    required this.emotions,
    this.id,
    required this.people,
    required this.places,
    required this.tags,
    required this.title,
  });

  Id? id;
  final DateTime date;
  final double clarity;
  final List<String> dreamTypes;
  final List<String> emotions;
  final List<String> people;
  final List<String> places;
  final List<String> tags;
  final String description;
  final String title;
}
