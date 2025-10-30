import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvatar extends StatelessWidget {
  final String initial;
  final VoidCallback ontap;
  const UserAvatar({super.key, required this.initial, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(30),
        child: Text(
          initial,
          style: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(fontSize: 14.sp),
        ),
      ),
    );
  }
}
