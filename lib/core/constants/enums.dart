import 'package:flutter/material.dart';

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
  normal('Normal', 'Normal', Color(0xFF26ff00)),
  recurring('Recurrente', 'Recurrent', Color(0xFFffa200)),
  nightmare('Pesadilla', 'Nightmare', Color(0xFFFF1744)),
  lucid('Lúcido', 'Lucid', Color(0xFF536DFE)),
  prophetic('Profético', 'Prophetic', Color(0xFFF48FB1)),
  symbolic('Simbólico', 'Symbolic', Color(0xFF6e12c4));

  const DreamType(
    this.nameEs,
    this.nameEn,
    this.color,
  );
  final String nameEs;
  final String nameEn;
  final Color color;

  static DreamType getDreamType(String dreamType) {
    final type = dreamType.toLowerCase();
    return DreamType.values.firstWhere(
      (e) => e.nameEn.toLowerCase() == type || e.nameEs.toLowerCase() == type,
      orElse: () => DreamType.values
          .where(
            (e) => e.name.toLowerCase().startsWith(
                  dreamType.substring(
                    0,
                    2,
                  ),
                ),
          )
          .first,
    );
  }
}

enum MenuOption {
  edit,
  delete,
}

enum LanguageCode {
  english('en'),
  spanish('es');

  const LanguageCode(this.languageCode);
  final String languageCode;
}

enum FormType {
  edit,
  create,
}

enum SelectType {
  emotion,
  people,
  tags,
  places,
}

enum TimeRange {
  thirtyDays('Treinta días', 'Thirty days'),
  oneYear('Un año', 'One year'),
  all('Todos', 'All');

  const TimeRange(
    this.nameEs,
    this.nameEn,
  );
  final String nameEs;
  final String nameEn;
}
