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
  normal('Normal'),
  recurring('Recurrente'),
  nightmare('Pesadilla'),
  lucid('Lúcido'),
  prophetic('Profético'),
  symbolic('Simbólico');

  const DreamType(this.dreamTypeName);
  final String dreamTypeName;
}

enum MenuOption {
  edit,
  delete,
}
