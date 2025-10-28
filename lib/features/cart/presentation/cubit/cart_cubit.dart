import 'package:colt_ecommerce_app/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:colt_ecommerce_app/features/products/data/model/products_response_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());

  final List<CartItem> _cart = [];

  List<CartItem> get cartItems => List.unmodifiable(_cart);

  void addToCart(ProductsResponseModel product) {
    final existingIndex = _cart.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex != -1) {
      _cart[existingIndex] = _cart[existingIndex].copyWith(
        quantity: _cart[existingIndex].quantity + 1,
      );
    } else {
      _cart.add(CartItem(product: product, quantity: 1));
    }

    _emitUpdatedState();
  }

  void removeFromCart(int productId) {
    _cart.removeWhere((item) => item.product.id == productId);
    _emitUpdatedState();
  }

  void increaseQuantity(int productId) {
    final index = _cart.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _cart[index] = _cart[index].copyWith(quantity: _cart[index].quantity + 1);
      _emitUpdatedState();
    }
  }

  void decreaseQuantity(int productId) {
    final index = _cart.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      final item = _cart[index];
      if (item.quantity > 1) {
        _cart[index] = item.copyWith(quantity: item.quantity - 1);
      } else {
        _cart.removeAt(index);
      }
      _emitUpdatedState();
    }
  }

  double get totalPrice {
    return _cart.fold(
      0.0,
      (sum, item) => sum + (item.product.price) * item.quantity,
    );
  }

  void _emitUpdatedState() {
    emit(
      CartState.updated(
        cartItems: List.unmodifiable(_cart),
        totalPrice: totalPrice,
      ),
    );
  }

  void clearCart() {
    _cart.clear();
    _emitUpdatedState();
  }
}
