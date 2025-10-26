import 'package:colt_ecommerce_app/features/home/presentation/widget/cart_screen.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/user_avatar.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const UserAvatar(initial: 'A'),
        const Spacer(),
        const CartButton(itemCount: 0),
      ],
    );
  }
}
