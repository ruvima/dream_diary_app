import 'package:flutter/material.dart';

/// 96px - Light weight
class KHeadline1 extends StatelessWidget {
  const KHeadline1(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
  });

  final Color? color;
  final int? maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return _KGenericText(
      text,
      color: color,
      fontSize: 96,
      fontWeight: FontWeight.w300,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

/// 60px - Light weight
class KHeadline2 extends StatelessWidget {
  const KHeadline2(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
  });

  final Color? color;
  final int? maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return _KGenericText(
      text,
      color: color,
      fontSize: 60,
      fontWeight: FontWeight.w300,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

/// 48px - Normal weight
class KHeadline3 extends StatelessWidget {
  const KHeadline3(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
  });

  final Color? color;
  final int? maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return _KGenericText(
      text,
      color: color,
      fontSize: 48,
      fontWeight: FontWeight.w400,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

/// 34px - Normal weight
class KHeadline4 extends StatelessWidget {
  const KHeadline4(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
  });

  final Color? color;
  final int? maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return _KGenericText(
      text,
      color: color,
      fontSize: 34,
      fontWeight: FontWeight.w400,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

/// 24px - Normal weight
class KHeadline5 extends StatelessWidget {
  const KHeadline5(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
  });

  final Color? color;
  final int? maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return _KGenericText(
      text,
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

/// 20px - Medium weight
class KHeadline6 extends StatelessWidget {
  const KHeadline6(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.fontWeight,
  });

  final Color? color;
  final int? maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return _KGenericText(
      text,
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

/// 12px - Normal weight
class KTextSmall extends StatelessWidget {
  const KTextSmall(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.textAlign,
    this.overflow,
  });

  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return _KGenericText(
      text,
      color: color,
      fontSize: 12,
      fontWeight: fontWeight ?? FontWeight.w400,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

/// 16px - Normal weight
class KTextMedium extends StatelessWidget {
  const KTextMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
  });

  final Color? color;
  final int? maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return _KGenericText(
      text,
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

/// 22px - Normal weight
class KTextLarge extends StatelessWidget {
  const KTextLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.textAlign,
    this.overflow,
  });

  final Color? color;
  final int? maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return _KGenericText(
      text,
      color: color,
      fontSize: 22,
      fontWeight: FontWeight.w400,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

/// Generic text widget with shared configuration
class _KGenericText extends StatelessWidget {
  const _KGenericText(
    this.text, {
    required this.fontSize,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.textAlign,
    this.overflow,
  });

  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        overflow: overflow,
      ),
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
