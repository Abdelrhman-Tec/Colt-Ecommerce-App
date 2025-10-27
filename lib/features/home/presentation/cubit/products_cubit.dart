import 'package:colt_ecommerce_app/core/databases/api/api_result.dart';
import 'package:colt_ecommerce_app/features/home/data/model/products_response_model.dart';
import 'package:colt_ecommerce_app/features/home/data/repo/products_repo.dart';
import 'package:colt_ecommerce_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<HomeState<List<ProductsResponseModel>>> {
  final ProductsRepo productsRepo;

  ProductsCubit(this.productsRepo) : super(HomeState.initial());

  Future<void> getAllProducts() async {
    emit(HomeState.loading());
    try {
      final result = await productsRepo.getAllProducts();
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
