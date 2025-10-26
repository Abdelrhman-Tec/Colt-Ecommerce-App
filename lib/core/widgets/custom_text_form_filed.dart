import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final double borderRadius;
  final Color? fillColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.borderRadius = 12.0,
    this.fillColor,
    this.textStyle,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      style: textStyle ?? theme.textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            hintStyle ??
            theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
        filled: true,
        fillColor: fillColor ?? theme.inputDecorationTheme.fillColor,

        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: prefixIcon,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 24,
          minHeight: 24,
        ),

        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: suffixIcon,
              )
            : null,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 24,
          minHeight: 24,
        ),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: theme.primaryColor, width: 2),
        ),
      ),
    );
  }
}
