import 'package:colt_ecommerce_app/features/home/data/model/categories_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'products_response_model.g.dart';

@JsonSerializable()
class ProductsResponseModel {
  final int id;
  final String title;
  final String slug;
  final int price;
  final String description;
  final CategoriesResponseModel category;
  final List<String> images;
  final String creationAt;
  final String updatedAt;

  ProductsResponseModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseModelToJson(this);
}
