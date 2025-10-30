part of 'wishlist_cubit.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState.initial() = _Initial;

  const factory WishlistState.updated({
    required List<ProductsResponseModel> wishlistItems,
  }) = _Updated;
}
