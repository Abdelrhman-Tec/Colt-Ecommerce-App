import 'package:colt_ecommerce_app/core/networking/api/api_constants.dart';
import 'package:colt_ecommerce_app/features/categories/data/model/categories_response_model.dart';
import 'package:colt_ecommerce_app/features/products/data/model/products_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;
  @GET(ApiConstants.categories)
  Future<List<CategoriesResponseModel>> getAllCategories();
  @GET(ApiConstants.products)
  Future<List<ProductsResponseModel>> getAllProducts();
}
