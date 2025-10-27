import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void loadDataIfNeeded(BuildContext context) {
  final productsCubit = context.read<ProductsCubit>();
  final categoriesCubit = context.read<CategoriesCubit>();

  if (!productsCubit.isLoaded && !productsCubit.isLoading) {
    productsCubit.getAllProducts();
  }

  if (!categoriesCubit.isLoaded && !categoriesCubit.isLoading) {
    categoriesCubit.getAllCategories();
  }
}
