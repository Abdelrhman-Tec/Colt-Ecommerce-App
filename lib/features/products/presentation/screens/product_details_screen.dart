import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:colt_ecommerce_app/features/products/data/model/products_response_model.dart';
import 'package:colt_ecommerce_app/features/products/presentation/widget/add_to_cart_button.dart';
import 'package:colt_ecommerce_app/features/products/presentation/widget/product_header.dart';
import 'package:colt_ecommerce_app/features/products/presentation/widget/product_images.dart';
import 'package:colt_ecommerce_app/features/products/presentation/widget/product_info_section.dart';
import 'package:colt_ecommerce_app/features/products/presentation/widget/product_selectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductsResponseModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectedSize = '';
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductHeader(),
              verticalSpace(20),
              ProductImages(imageUrl: widget.product.images.first),
              verticalSpace(16),
              ProductInfoSection(product: widget.product),
              verticalSpace(16),
              ProductSelectors(
                sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                colors: ["Red", "Black", "Blue", "Green"],
                selectedSize: selectedSize,
                quantity: quantity,
                onSizeChanged: (v) => setState(() => selectedSize = v),
                onQuantityChanged: (v) => setState(() => quantity = v),
              ),
              verticalSpace(24),
              Text(
                widget.product.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 16.sp,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              verticalSpace(24),
              AddToCartButton(
                price: widget.product.price.toDouble(),
                ontap: () =>
                    context.read<CartCubit>().addToCart(widget.product),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
