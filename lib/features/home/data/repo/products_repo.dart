import 'package:colt_ecommerce_app/core/databases/api/api_result.dart';
import 'package:colt_ecommerce_app/core/databases/api/api_services.dart';
import 'package:colt_ecommerce_app/core/errors/api_error_handler.dart';
import 'package:colt_ecommerce_app/features/home/data/model/products_response_model.dart';

class ProductsRepo {
  final ApiServices apiServices;
  ProductsRepo({required this.apiServices});

  Future<ApiResult<List<ProductsResponseModel>>> getAllProducts() async {
    try {
      final response = await apiServices.getAllProducts();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e.toString()));
    }
  }
}
