import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';

class ThemeToggleButton extends StatelessWidget {
  final bool isLightMode;
  final VoidCallback onToggle;

  const ThemeToggleButton({
    super.key,
    required this.isLightMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final icon = isLightMode
        ? Icons.wb_sunny_outlined
        : Icons.nights_stay_outlined;
    final iconColor = isLightMode
        ? AppColors.primary
        : Theme.of(context).textTheme.titleLarge?.color ?? Colors.white;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: isLightMode
              ? AppColors.primary
              : Theme.of(context).colorScheme.primary.withOpacity(0.3),
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.circular(25.w),
        color: isLightMode
            ? AppColors.primary.withOpacity(0.1)
            : Colors.transparent,
        boxShadow: [
          if (isLightMode)
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 8.w,
              offset: Offset(0, 2.w),
            ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25.w),
          onTap: onToggle,
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                icon,
                key: ValueKey(isLightMode),
                color: iconColor,
                size: 24.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
