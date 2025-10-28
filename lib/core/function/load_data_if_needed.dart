import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void loadDataIfNeeded(
  BuildContext context, {
  bool loadProducts = true,
  bool loadCategories = true,
}) {
  final productsCubit = context.read<ProductsCubit>();
  final categoriesCubit = context.read<CategoriesCubit>();

  if (loadProducts && !productsCubit.isLoaded && !productsCubit.isLoading) {
    productsCubit.getAllProducts();
  }

  if (loadCategories &&
      !categoriesCubit.isLoaded &&
      !categoriesCubit.isLoading) {
    categoriesCubit.getAllCategories();
  }
}
