import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/networking/cache/cache_helper.dart';
import 'package:colt_ecommerce_app/features/products/data/model/products_response_model.dart';
import 'package:colt_ecommerce_app/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String name;
  final double price;
  final VoidCallback onTap;
  final ProductsResponseModel product;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.onTap,
    required this.product,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    final saved = CacheHelper.getDataString(key: "wishlist");
    List<dynamic> savedFavorites = [];
    if (saved != null && saved.isNotEmpty) {
      savedFavorites = jsonDecode(saved);
    }
    isFavorite = savedFavorites.any((item) => item['id'] == widget.product.id);
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    final cubit = context.read<WishlistCubit>();
    if (isFavorite) {
      cubit.addToWishlist(widget.product);
    } else {
      cubit.removeFromWishlist(widget.product.id);
    }

    CacheHelper.saveData(
      key: "wishlist",
      value: cubit.wishlistItems.map((e) => e.toJson()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12.r),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: toggleFavorite,
                    child: Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        "asset/icon/heart.svg",
                        color: isFavorite
                            ? Colors.red
                            : Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text(
                  '\$${widget.price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
