import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color background;
  final double iconSize;

  const SocialButton({
    super.key,
    required this.icon,
    required this.text,
    required this.background,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      textColor: Theme.of(context).textTheme.titleLarge!.color!,
      iconSize: iconSize,
      icon: icon,
      backgroundColor: background,
      borderRadius: 50,
      text: text,
      onPressed: () {},
    );
  }
}
