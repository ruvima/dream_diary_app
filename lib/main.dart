import 'package:flutter/material.dart';

import 'config/theme/app_theme.dart';
import 'presentation/screens/dream_diary/dream_diary_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dream Diary App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const DreamDiary(),
    );
  }
}
