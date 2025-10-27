import 'package:colt_ecommerce_app/core/databases/api/api_result.dart';
import 'package:colt_ecommerce_app/features/home/data/model/categories_response_model.dart';
import 'package:colt_ecommerce_app/features/home/data/repo/categories_repo.dart';
import 'package:colt_ecommerce_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<HomeState<List<CategoriesResponseModel>>> {
  final CategoriesRepo categoriesRepo;

  CategoriesCubit(this.categoriesRepo) : super(HomeState.initial());

  Future<void> getAllCategories() async {
    emit(HomeState.loading());
    try {
      final result = await categoriesRepo.getAllCategories();
      result.when(
        success: (data) => emit(HomeState.success(data)),
        failure: (error) => emit(
          HomeState.error(message: error.apiErrorModel.message.toString()),
        ),
      );
    } catch (e) {
      emit(HomeState.error(message: e.toString()));
    }
  }
}
