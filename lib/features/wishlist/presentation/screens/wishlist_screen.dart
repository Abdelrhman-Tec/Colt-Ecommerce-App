import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/back_button.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/header.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/product_card.dart';
import 'package:colt_ecommerce_app/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 63.h),
          child: Column(
            children: [
              CustomBackButton(),
              verticalSpace(20),
              Header(
                textTheme: Theme.of(context).textTheme,
                title: T.current.myFavourites,
              ),
              verticalSpace(20),
              Expanded(
                child: BlocBuilder<WishlistCubit, WishlistState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => Center(child: CircularProgressIndicator()),
                      updated: (wishlistItems) {
                        if (wishlistItems.isEmpty) {
                          return Center(
                            child: Text(T.current.noItemsInWishlist),
                          );
                        }
                        return ListView.separated(
                          itemCount: wishlistItems.length,
                          separatorBuilder: (_, __) => verticalSpace(10),
                          itemBuilder: (context, index) {
                            final product = wishlistItems[index];
                            return ProductCard(
                              image: product.images.first,
                              name: product.title,
                              price: product.price.toDouble(),
                              onTap: () {},
                              product: product,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
