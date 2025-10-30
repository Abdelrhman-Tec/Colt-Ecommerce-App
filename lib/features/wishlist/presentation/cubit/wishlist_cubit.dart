import 'dart:convert';
import 'package:colt_ecommerce_app/features/products/data/model/products_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:colt_ecommerce_app/core/networking/cache/cache_helper.dart';

part 'wishlist_state.dart';
part 'wishlist_cubit.freezed.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(const WishlistState.initial()) {
    _loadWishlistFromCache();
  }

  final List<ProductsResponseModel> _wishlist = [];

  List<ProductsResponseModel> get wishlistItems => List.unmodifiable(_wishlist);

  void addToWishlist(ProductsResponseModel product) {
    if (!_wishlist.any((item) => item.id == product.id)) {
      _wishlist.add(product);
      _emitUpdatedState();
    }
  }

  void removeFromWishlist(int productId) {
    _wishlist.removeWhere((item) => item.id == productId);
    _emitUpdatedState();
  }

  void clearWishlist() {
    _wishlist.clear();
    _emitUpdatedState();
  }

  void _emitUpdatedState() {
    emit(WishlistState.updated(wishlistItems: List.unmodifiable(_wishlist)));

    CacheHelper.saveData(
      key: "wishlist",
      value: jsonEncode(_wishlist.map((e) => e.toJson()).toList()),
    );
  }

  void _loadWishlistFromCache() {
    final saved = CacheHelper.getDataString(key: "wishlist");
    if (saved != null && saved.isNotEmpty) {
      final List decoded = jsonDecode(saved);
      final wishlist = decoded
          .map((e) => ProductsResponseModel.fromJson(e))
          .toList();
      _wishlist.addAll(wishlist);
    }
    emit(WishlistState.updated(wishlistItems: List.unmodifiable(_wishlist)));
  }
}
