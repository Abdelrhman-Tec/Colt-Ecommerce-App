import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasNumber;
  final bool hasSpecialCharacter;
  final bool hasMinLength;
  const PasswordValidation({
    super.key,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasNumber,
    required this.hasSpecialCharacter,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildPasswordValidation(
          context,
          'At least 1 hasLowercase',
          hasLowercase,
        ),
        buildPasswordValidation(
          context,
          'At least 1 hasUppercase',
          hasUppercase,
        ),
        buildPasswordValidation(context, 'At least 1 hasNumber', hasNumber),
        buildPasswordValidation(
          context,
          'At least 1 hasMinLength',
          hasMinLength,
        ),
        buildPasswordValidation(
          context,
          'At least 8 hasSpecialCharacter',
          hasSpecialCharacter,
        ),
      ],
    );
  }

  Widget buildPasswordValidation(
    BuildContext context,
    String text,
    bool hasIsValidated,
  ) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: !hasIsValidated
              ? Theme.of(context).colorScheme.error
              : Colors.green,
        ),
        horizontalSpace(10),
        Text(
          text,
          style: TextStyle(
            color: !hasIsValidated
                ? Theme.of(context).colorScheme.error
                : Colors.green,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            decoration: hasIsValidated
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationColor: Colors.green,
            decorationThickness: 2,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
      ],
    );
  }
}
