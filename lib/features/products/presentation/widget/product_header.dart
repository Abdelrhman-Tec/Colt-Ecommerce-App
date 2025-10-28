// features/product_details/presentation/widgets/product_header.dart
import 'package:flutter/material.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/back_button.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(
          iconPath: "asset/icon/arrowleft2.svg",
          backgroundColor: theme.colorScheme.primaryContainer.withAlpha(100),
        ),
        CustomBackButton(
          iconPath: "asset/icon/heart.svg",
          backgroundColor: theme.colorScheme.primaryContainer.withAlpha(100),
          onTap: () {},
        ),
      ],
    );
  }
}
