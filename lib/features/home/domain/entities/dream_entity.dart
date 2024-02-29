import 'package:isar/isar.dart';

part 'dream_entity.g.dart';

@collection
class DreamEntity {
  Id get isarId => _fastHash(id);

  final DateTime date;
  final double clarity;
  final List<String> dreamTypes;
  final List<String> emotions;
  final List<String> people;
  final List<String> places;
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
    required this.places,
    required this.tags,
    required this.title,
  });

  int _fastHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }
    return hash;
  }
}
