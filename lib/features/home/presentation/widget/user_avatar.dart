import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvatar extends StatelessWidget {
  final String initial;
  const UserAvatar({super.key, required this.initial});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(30),
      child: Text(
        initial,
        style: Theme.of(
          context,
        ).textTheme.displaySmall?.copyWith(fontSize: 14.sp),
      ),
    );
  }
}
