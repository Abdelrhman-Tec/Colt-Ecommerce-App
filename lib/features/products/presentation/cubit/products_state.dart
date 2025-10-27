import 'package:freezed_annotation/freezed_annotation.dart';
part 'products_state.freezed.dart';

@freezed
class ProductsState<T> with _$ProductsState<T> {
  const factory ProductsState.initial() = Initial<T>;
  const factory ProductsState.loading() = Loading<T>;
  const factory ProductsState.success(T data) = Success<T>;
  const factory ProductsState.error({required String message}) = Error<T>;
}
