import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';

class CustomBackButton extends StatelessWidget {
  final String iconPath;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const CustomBackButton({
    super.key,
    this.iconPath = "asset/icon/arrowleft2.svg",
    this.iconColor,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: CircleAvatar(
        backgroundColor:
            backgroundColor ??
            Theme.of(context).colorScheme.primary.withAlpha(30),
        child: GestureDetector(
          onTap: onTap ?? () => context.pop(),
          child: Center(
            child: SvgPicture.asset(
              iconPath,
              color: iconColor ?? Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ),
      ),
    );
  }
}
