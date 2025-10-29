// ignore_for_file: use_build_context_synchronously

import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/networking/stripe_service/stripe_manger.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:colt_ecommerce_app/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(T.current.checkout),
        backgroundColor: theme.primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Expanded(child: _buildCartItems(context)),
              _buildSummarySection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItems(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartItems = state.maybeWhen(
          updated: (items, _) => items,
          orElse: () => [],
        );
        if (cartItems.isEmpty) {
          return Center(child: Text(T.current.yourCartIsEmpty));
        }

        return ListView.separated(
          itemCount: cartItems.length,
          separatorBuilder: (_, __) => verticalSpace(12),
          itemBuilder: (context, index) {
            final item = cartItems[index];
            return ListTile(
              leading: Image.network(
                item.product.images.isNotEmpty
                    ? item.product.images.first
                    : 'assets/icon/default.png',
                width: 50,
              ),
              title: Text(item.product.title),
              subtitle: Text(
                "\$${item.product.price.toStringAsFixed(2)} x ${item.quantity}",
              ),
              trailing: Text(
                "\$${(item.product.price * item.quantity).toStringAsFixed(2)}",
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSummarySection(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartItems = state.maybeWhen(
          updated: (items, _) => items,
          orElse: () => [],
        );
        if (cartItems.isEmpty) return const SizedBox.shrink();

        final subtotal = cartItems.fold<double>(
          0,
          (sum, item) => sum + (item.product.price.toDouble() * item.quantity),
        );
        const shipping = 8.0;
        const tax = 0.0;
        final total = subtotal + shipping + tax;

        return Column(
          children: [
            _buildPriceRow(T.current.subtotal, subtotal),
            _buildPriceRow(T.current.shipping, shipping),
            _buildPriceRow(T.current.tax, tax),
            Divider(),
            _buildPriceRow(T.current.total, total, isBold: true),
            verticalSpace(20),
            CustomButton(
              text: T.current.payNow,
              backgroundColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              height: 55.h,
              borderRadius: 50,
              onPressed: () => _handlePayment(context, total),
            ),
            verticalSpace(20),
          ],
        );
      },
    );
  }

  Widget _buildPriceRow(String title, double amount, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handlePayment(BuildContext context, double total) async {
    try {
      final amountInCents = (total).toInt();
      await PaymentManager.makePayment(amountInCents, 'usd');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Payment successful!",
            style: Theme.of(
              context,
            ).textTheme.displaySmall!.copyWith(fontSize: 15.sp),
          ),
          backgroundColor: Colors.green,
        ),
      );

      context.read<CartCubit>().clearCart();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Payment failed: $e",
            style: Theme.of(
              context,
            ).textTheme.displaySmall!.copyWith(fontSize: 15.sp),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
