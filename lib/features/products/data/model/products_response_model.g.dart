// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponseModel _$ProductsResponseModelFromJson(
  Map<String, dynamic> json,
) => ProductsResponseModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  slug: json['slug'] as String,
  price: (json['price'] as num).toInt(),
  description: json['description'] as String,
  category: json['category'] == null
      ? null
      : CategoriesResponseModel.fromJson(
          json['category'] as Map<String, dynamic>,
        ),
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  creationAt: json['creationAt'] as String,
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$ProductsResponseModelToJson(
  ProductsResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'slug': instance.slug,
  'price': instance.price,
  'description': instance.description,
  'category': instance.category,
  'images': instance.images,
  'creationAt': instance.creationAt,
  'updatedAt': instance.updatedAt,
};
