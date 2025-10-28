import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:colt_ecommerce_app/features/cart/presentation/cubit/cart_state.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/cart_button.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const UserAvatar(initial: 'A'),
        const Spacer(),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final itemCount = state.maybeWhen(
              updated: (items, _) => items.fold<int>(
                0,
                (prev, element) => prev + element.quantity,
              ),
              orElse: () => 0,
            );

            return CartButton(
              itemCount: itemCount,
              ontap: () => context.pushNamed(Routes.cartScreen),
            );
          },
        ),
      ],
    );
  }
}
