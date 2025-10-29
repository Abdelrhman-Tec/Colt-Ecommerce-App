import 'package:colt_ecommerce_app/core/networking/api/api_result.dart';
import 'package:colt_ecommerce_app/core/networking/api/api_services.dart';
import 'package:colt_ecommerce_app/core/errors/api_error_handler.dart';
import 'package:colt_ecommerce_app/features/categories/data/model/categories_response_model.dart';

class CategoriesRepo {
  final ApiServices apiServices;
  CategoriesRepo({required this.apiServices});

  Future<ApiResult<List<CategoriesResponseModel>>> getAllCategories() async {
    try {
      final response = await apiServices.getAllCategories();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e.toString()));
    }
  }
}
