import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final TextTheme textTheme;
  final String title;

  const Header({super.key, required this.textTheme, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: textTheme.displayLarge!);
  }
}
