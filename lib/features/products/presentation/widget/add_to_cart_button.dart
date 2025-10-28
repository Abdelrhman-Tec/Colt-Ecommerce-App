// features/product_details/presentation/widgets/add_to_cart_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartButton extends StatelessWidget {
  final double price;
  final VoidCallback ontap;
  const AddToCartButton({super.key, required this.price, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        minimumSize: const Size(double.infinity, 56),
      ),
      child: Text(
        '\$${price.toStringAsFixed(2)} | Add to Bag',
        style: theme.textTheme.displaySmall?.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
