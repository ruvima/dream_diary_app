import 'package:flutter/material.dart';

import '../../utils/constants/constants.dart';

/// headline1: This is the largest text style and is used for very large headings.
///   - Font size: 96.0
///   - Font weight: Normal (700)
///   - Letter spacing: -1.5
class Headline1Text extends StatelessWidget {
  final String text;

  const Headline1Text(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}

/// headline2: This style is used for headings larger than headline3.
///   - Font size: 60.0
///   - Font weight: Normal (700)
///   - Letter spacing: -0.5
class Headline2Text extends StatelessWidget {
  final String text;

  const Headline2Text(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}

/// headline3: Used for large headings.
///   - Font size: 48.0
///   - Font weight: Normal (700)
///   - Letter spacing: 0.0
class Headline3Text extends StatelessWidget {
  final String text;

  const Headline3Text(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }
}

/// headline4: Used for moderately sized headings.
///   - Font size: 34.0
///   - Font weight: Normal (700)
///   - Letter spacing: 0.25
class Headline4Text extends StatelessWidget {
  final String text;

  const Headline4Text(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

/// headline5: A smaller text style than headline4 suitable for less prominent headings.
///   - Font size: 24.0
///   - Font weight: Normal (700)
///   - Letter spacing: 0.0
class Headline5Text extends StatelessWidget {
  final String text;

  const Headline5Text(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}

/// headline6: This style is used for headings smaller than headline5.
///   - Font size: 20.0
///   - Font weight: Normal (700)
///   - Letter spacing: 0.15
class Headline6Text extends StatelessWidget {
  final String text;

  const Headline6Text(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

/// subtitle1: Commonly used for subtitles and secondary text in the UI.
///   - Font size: 16.0
///   - Font weight: Normal (400)
///   - Letter spacing: 0.15
class Subtitle1Text extends StatelessWidget {
  final String text;

  const Subtitle1Text(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

/// subtitle2: Similar to subtitle1 but with slightly smaller font size.
///   - Font size: 14.0
///   - Font weight: Normal (400)
///   - Letter spacing: 0.1
class Subtitle2Text extends StatelessWidget {
  final String text;

  const Subtitle2Text(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}

/// bodyText1: Text style for the main content of body text.
///   - Font size: 16.0
///   - Font weight: Normal (400)
///   - Letter spacing: 0.5
class BodyText1Text extends StatelessWidget {
  final String text;

  const BodyText1Text(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

/// bodyText2: Similar to bodyText1 but with slightly smaller letter spacing.
///   - Font size: 14.0
///   - Font weight: Normal (400)
///   - Letter spacing: 0.25
class BodyText2Text extends StatelessWidget {
  final String text;

  const BodyText2Text(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

class AppTextStyles {
  static Widget title(String text, {Color color = Colors.white}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: TextSize.s20,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }

  static Widget body(String text, {Color color = Colors.white}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: TextSize.s16,
        color: color,
      ),
    );
  }

  static Widget smallText(String text, {Color color = Colors.white}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: TextSize.s12,
        color: color,
      ),
    );
  }
}
