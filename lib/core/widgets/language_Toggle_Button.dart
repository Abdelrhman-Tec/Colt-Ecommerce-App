import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';

class LanguageToggleButton extends StatelessWidget {
  final bool isEnglish;
  final VoidCallback onToggle;

  const LanguageToggleButton({
    super.key,
    required this.isEnglish,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final text = isEnglish ? 'EN' : 'AR';
    final color = isEnglish
        ? AppColors.primary
        : Theme.of(context).textTheme.titleLarge?.color ?? Colors.white;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: isEnglish
              ? AppColors.primary
              : Theme.of(context).colorScheme.primary.withOpacity(0.3),
          width: 1.5.w,
        ),
        borderRadius: BorderRadius.circular(25.w),
        color: isEnglish
            ? AppColors.primary.withOpacity(0.1)
            : Colors.transparent,
        boxShadow: [
          if (isEnglish)
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
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Text(
                text,
                key: ValueKey(isEnglish),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
