import 'package:freezed_annotation/freezed_annotation.dart';
import 'categories_response_model.dart';
import 'products_response_model.dart';

part 'home_data.freezed.dart';
part 'home_data.g.dart';

@freezed
abstract class HomeData with _$HomeData {
  const factory HomeData({
    required List<CategoriesResponseModel> categories,
    required List<ProductsResponseModel> products,
  }) = _HomeData;

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
}
