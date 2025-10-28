import 'package:colt_ecommerce_app/features/products/data/model/products_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.updated({
    required List<CartItem> cartItems,
    required double totalPrice,
  }) = _Updated;
}

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    required ProductsResponseModel product,
    required int quantity,
  }) = _CartItem;
}
