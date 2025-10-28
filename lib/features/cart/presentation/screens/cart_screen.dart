import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:colt_ecommerce_app/features/cart/presentation/cubit/cart_state.dart';
import 'package:colt_ecommerce_app/features/cart/presentation/widgets/cart_item_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(title: T.current.cart, showIcon: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              _buildRemoveAll(context, theme),
              verticalSpace(20),
              Flexible(child: _buildCartItemsList(context, theme)),
              _buildSummarySection(context, theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRemoveAll(BuildContext context, ThemeData theme) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () => context.read<CartCubit>().clearCart(),
        child: Text(
          T.current.removeAll,
          style: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.error,
          ),
        ),
      ),
    );
  }

  Widget _buildCartItemsList(BuildContext context, ThemeData theme) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartItems = state.maybeWhen(
          updated: (items, _) => items,
          orElse: () => [],
        );

        if (cartItems.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("asset/icon/parcel 1.png", width: 100),
              verticalSpace(10),
              Text(
                T.current.yourCartIsEmpty,
                style: theme.textTheme.headlineSmall!.copyWith(fontSize: 20.sp),
              ),
              verticalSpace(25),
              CustomButton(
                width: 220,
                backgroundColor: theme.colorScheme.primary,
                text: T.current.exploreCategories,
                textColor: theme.colorScheme.onPrimary,
                borderRadius: 50,
                onPressed: () => context.pushNamed(Routes.allCategoriesScreen),
              ),
            ],
          );
        }

        return ListView.separated(
          itemCount: cartItems.length,
          separatorBuilder: (_, __) => verticalSpace(12),
          itemBuilder: (context, index) {
            final item = cartItems[index];
            return CartItemCard(
              image: item.product.images.isNotEmpty
                  ? item.product.images.first
                  : 'assets/icon/default.png',
              title: item.product.title,
              price: item.product.price.toDouble(),
              quantity: item.quantity,
              onRemove: () =>
                  context.read<CartCubit>().removeFromCart(item.product.id),
              onQuantityChanged: (newQty) {
                if (newQty > item.quantity) {
                  context.read<CartCubit>().increaseQuantity(item.product.id);
                } else if (newQty < item.quantity) {
                  context.read<CartCubit>().decreaseQuantity(item.product.id);
                }
              },
            );
          },
        );
      },
    );
  }

  Widget _buildSummarySection(BuildContext context, ThemeData theme) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartItems = state.maybeWhen(
          updated: (items, _) => items,
          orElse: () => [],
        );

        if (cartItems.isEmpty) {
          return const SizedBox.shrink();
        }

        final total = cartItems.fold<double>(
          0,
          (sum, item) => sum + (item.product.price.toDouble() * item.quantity),
        );

        const double shipping = 8.0;
        const double tax = 0.0;
        final subtotal = total;
        final totalWithShipping = subtotal + shipping + tax;

        return Container(
          padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPriceRow(
                context,
                theme,
                'Subtotal',
                '\$${subtotal.toStringAsFixed(0)}',
              ),
              _buildPriceRow(
                context,
                theme,
                'Shipping Cost',
                '\$${shipping.toStringAsFixed(2)}',
              ),
              _buildPriceRow(
                context,
                theme,
                'Tax',
                '\$${tax.toStringAsFixed(2)}',
              ),
              Divider(height: 25.h, color: theme.dividerColor),
              _buildPriceRow(
                context,
                theme,
                'Total',
                '\$${totalWithShipping.toStringAsFixed(0)}',
                isBold: true,
              ),
              verticalSpace(20),
              _buildCouponInput(context, theme),
              verticalSpace(50),
              CustomButton(
                text: T.current.checkout,
                backgroundColor: theme.colorScheme.primary,
                textColor: theme.colorScheme.onPrimary,
                height: 55.h,
                borderRadius: 50,
                onPressed: () {},
              ),
              verticalSpace(50),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPriceRow(
    BuildContext context,
    ThemeData theme,
    String title,
    String value, {
    bool isBold = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              color: theme.textTheme.bodyMedium!.color!.withOpacity(0.8),
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
              color: isBold
                  ? theme.colorScheme.onSurface
                  : theme.textTheme.bodyMedium!.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponInput(BuildContext context, ThemeData theme) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          SizedBox(width: 15.w),
          Icon(
            Icons.local_offer_outlined,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter Coupon Code',
                  hintStyle: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.hintColor,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50.h,
            width: 50.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Icon(
              Icons.arrow_forward,
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
