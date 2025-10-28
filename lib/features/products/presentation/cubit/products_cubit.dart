import 'package:colt_ecommerce_app/core/databases/api/api_result.dart' as api;
import 'package:colt_ecommerce_app/features/products/data/model/products_response_model.dart';
import 'package:colt_ecommerce_app/features/products/data/repo/products_repo.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState<List<ProductsResponseModel>>> {
  final ProductsRepo productsRepo;

  ProductsCubit(this.productsRepo) : super(const ProductsState.initial());
  bool get isLoaded =>
      state.maybeWhen(success: (_) => true, orElse: () => false);
  bool get isLoading =>
      state.maybeWhen(loading: () => true, orElse: () => false);

  Future<void> getAllProducts() async {
    if (isLoaded || isLoading) return;
    emit(const ProductsState.loading());

    try {
      final result = await productsRepo.getAllProducts();

      result.when(
        success: (data) {
          emit(ProductsState.success(data));
        },
        failure: (error) {
          emit(
            ProductsState.error(
              message: error.apiErrorModel.message ?? 'Unknown error occurred',
            ),
          );
        },
      );
    } catch (e) {
      emit(ProductsState.error(message: e.toString()));
    }
  }

  List<ProductsResponseModel> getProductsByCategory(int categoryId) {
    final currentProducts = state.maybeWhen(
      success: (products) => products.cast<ProductsResponseModel>(),
      orElse: () => <ProductsResponseModel>[],
    );

    return currentProducts
        .where((product) => product.category?.id == categoryId)
        .toList();
  }
}
