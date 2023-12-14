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

enum Emotion {
  unknown('Desconocido'),
  verySad('Muy Triste'),
  sad('Triste'),
  neutral('Neutral'),
  happy('Feliz'),
  veryHappy('Muy Feliz');

  const Emotion(this.emotionName);
  final String emotionName;
}

enum DreamType {
  unknown('Desconocido'),
  nightmare('Pesadilla'),
  recurring('Recurrente'),
  lucid('Lúcido'),
  prophetic('Profético'),
  symbolic('Simbólico');

  const DreamType(this.dreamTypeName);
  final String dreamTypeName;
}

enum DreamClarity {
  unclear('Poco claro'),
  somewhatClear('Algo claro'),
  veryClear('Muy claro');

  const DreamClarity(this.dreamClarityName);
  final String dreamClarityName;
}
