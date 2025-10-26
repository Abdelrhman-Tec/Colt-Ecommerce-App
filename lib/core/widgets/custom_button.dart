import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? borderColor;

  final double borderRadius;
  final double elevation;
  final double height;
  final double width;

  final IconData? icon;
  final double iconSize;
  final bool isOutlined;
  final bool isDisabled;
  final Color shadowColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius = 12,
    this.elevation = 2,
    this.height = 50,
    this.width = double.infinity,
    this.icon,
    this.iconSize = 22,
    this.isOutlined = false,
    this.isDisabled = false,
    this.shadowColor = Colors.transparent,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color effectiveBackground = isOutlined
        ? Colors.transparent
        : (backgroundColor ?? theme.colorScheme.primary);

    final Color effectiveTextColor = isOutlined
        ? (textColor ?? theme.colorScheme.primary)
        : (textColor ?? theme.colorScheme.onPrimary);

    final Color effectiveBorderColor = borderColor ?? theme.colorScheme.primary;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          iconColor: iconColor,
          shadowColor: shadowColor,
          elevation: elevation,
          backgroundColor: effectiveBackground,
          foregroundColor: effectiveTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: isOutlined
                ? BorderSide(color: effectiveBorderColor, width: 2)
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: iconSize, color: effectiveTextColor),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: theme.textTheme.labelLarge?.copyWith(
                color: effectiveTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
