// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeData _$HomeDataFromJson(Map<String, dynamic> json) => _HomeData(
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoriesResponseModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  products: (json['products'] as List<dynamic>)
      .map((e) => ProductsResponseModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeDataToJson(_HomeData instance) => <String, dynamic>{
  'categories': instance.categories,
  'products': instance.products,
};
