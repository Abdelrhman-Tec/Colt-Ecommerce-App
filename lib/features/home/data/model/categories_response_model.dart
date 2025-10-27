import 'package:json_annotation/json_annotation.dart';
part 'categories_response_model.g.dart';

@JsonSerializable()
class CategoriesResponseModel {
  final int id;
  final String name;
  final String slug;

  @JsonKey(name: 'image')
  final String imageUrl;

  @JsonKey(name: 'creationAt')
  final String creationAt;

  @JsonKey(name: 'updatedAt')
  final String updatedAt;

  CategoriesResponseModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.imageUrl,
    required this.creationAt,
    required this.updatedAt,
  });

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseModelToJson(this);
}
