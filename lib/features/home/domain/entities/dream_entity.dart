class DreamEntity {
  final DateTime date;
  final DreamClarity clarity;
  final Emotion emotion;
  final List<DreamType> dreamTypes;
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
    required this.emotion,
    required this.id,
    required this.people,
    required this.tags,
    required this.title,
  });
}

enum Emotion { unknown, verySad, sad, neutral, happy, veryHappy }

enum DreamType { unknown, nightmare, recurring, lucid, prophetic, symbolic }

enum DreamClarity { unclear, somewhatClear, veryClear }
