import 'package:flutter/material.dart';

import '../core.dart';

class KTextFormField extends StatelessWidget {
  const KTextFormField({
    super.key,
    this.contentPadding = const EdgeInsets.all(KSizes.p16),
    this.controller,
    this.hint,
    this.keyboardType,
    this.label,
    this.maxLength,
    this.maxLines,
    this.obscureText = false,
    this.onChanged,
    this.prefixIcon,
    this.textInputAction,
    this.validator,
    this.suffixIcon,
  });

  final bool obscureText;
  final EdgeInsetsGeometry? contentPadding;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final int? maxLines;
  final String? hint;
  final String? label;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLength: maxLength,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: 16.0,
        color: theme.onSurface,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: theme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(KSizes.p12),
          borderSide: BorderSide.none,
        ),
        contentPadding: contentPadding,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(KSizes.p12),
          borderSide: BorderSide(color: theme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(KSizes.p12),
          borderSide: const BorderSide(
            color: AppColors.lightError,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(KSizes.p12),
          borderSide: const BorderSide(
            color: AppColors.lightError,
            width: 1.5,
          ),
        ),
        labelStyle: TextStyle(
          fontSize: 16.0,
          color: theme.onSurface.withOpacity(0.8),
        ),
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: theme.onSurface.withOpacity(0.4),
        ),
      ),
    );
  }
}
