import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final TextTheme textTheme;
  final String title;

  const Header({super.key, required this.textTheme, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 30.sp,
      ),
    );
  }
}
