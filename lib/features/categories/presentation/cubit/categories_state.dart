import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState<T> with _$CategoriesState<T> {
  const factory CategoriesState.initial() = _Initial<T>;
  const factory CategoriesState.loading() = Loading<T>;
  const factory CategoriesState.success(T data) = Success<T>;
  const factory CategoriesState.error({required String message}) = Error<T>;
}
