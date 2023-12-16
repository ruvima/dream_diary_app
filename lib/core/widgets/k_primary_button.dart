import 'package:flutter/material.dart';

import '../core.dart';

class KPrimaryButton extends StatelessWidget {
  const KPrimaryButton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.height = KSizes.p48,
    this.width,
    this.isSmall = false,
  });
  final String text;
  final bool isLoading;
  final bool isSmall;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SizedBox(
      height: height,
      width: width,
      child: FilledButton.tonal(
        style: FilledButton.styleFrom(
          foregroundColor: theme.onPrimary,
          backgroundColor: theme.primary,
        ),
        onPressed: onPressed,
        child: isSmall && isLoading
            ? Padding(
                padding: const EdgeInsets.all(4.0),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: theme.onPrimary,
                ),
              )
            : isSmall
                ? KTextSmall(text)
                : isLoading
                    ? CircularProgressIndicator(
                        color: theme.onPrimary,
                      )
                    : KHeadline6(text),
      ),
    );
  }
}
