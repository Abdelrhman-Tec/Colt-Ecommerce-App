import 'package:colt_ecommerce_app/core/networking/api/api_result.dart' as api;
import 'package:colt_ecommerce_app/features/categories/data/model/categories_response_model.dart';
import 'package:colt_ecommerce_app/features/categories/data/repo/categories_repo.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit
    extends Cubit<CategoriesState<List<CategoriesResponseModel>>> {
  final CategoriesRepo categoriesRepo;

  CategoriesCubit(this.categoriesRepo) : super(const CategoriesState.initial());

  bool get isLoaded =>
      state.maybeWhen(success: (_) => true, orElse: () => false);
  bool get isLoading =>
      state.maybeWhen(loading: () => true, orElse: () => false);

  Future<void> getAllCategories() async {
    if (isLoaded || isLoading) return;

    emit(const CategoriesState.loading());

    try {
      final result = await categoriesRepo.getAllCategories();

      result.when(
        success: (data) {
          emit(CategoriesState.success(data));
        },
        failure: (error) {
          emit(
            CategoriesState.error(
              message: error.apiErrorModel.message ?? 'Unknown error occurred',
            ),
          );
        },
      );
    } catch (e) {
      emit(CategoriesState.error(message: e.toString()));
    }
  }
}
