part of 'home_cubit.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success(T data) = Success<T>;
  const factory HomeState.error({required String message}) = Error<T>;
}
