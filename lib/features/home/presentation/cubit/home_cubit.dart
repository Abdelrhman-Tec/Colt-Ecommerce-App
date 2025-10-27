import 'package:colt_ecommerce_app/core/databases/api/api_result.dart';
import 'package:colt_ecommerce_app/features/home/data/model/home_data.dart';
import 'package:colt_ecommerce_app/features/home/data/repo/categories_repo.dart';
import 'package:colt_ecommerce_app/features/home/data/repo/products_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState<HomeData>> {
  final CategoriesRepo categoriesRepo;
  final ProductsRepo productsRepo;

  HomeCubit(this.categoriesRepo, this.productsRepo)
    : super(HomeState.initial());

  Future<void> gethAllData() async {
    emit(HomeState.loading());
    try {
      final categoriesResult = await categoriesRepo.getAllCategories();
      final productsResult = await productsRepo.getAllProducts();

      categoriesResult.when(
        success: (categories) {
          productsResult.when(
            success: (products) => emit(
              HomeState.success(
                HomeData(categories: categories, products: products),
              ),
            ),
            failure: (error) => emit(
              HomeState.error(message: error.apiErrorModel.message.toString()),
            ),
          );
        },
        failure: (error) => emit(
          HomeState.error(message: error.apiErrorModel.message.toString()),
        ),
      );
    } catch (e) {
      emit(HomeState.error(message: e.toString()));
    }
  }
}
