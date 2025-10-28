import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Load products if needed
void loadProductsIfNeeded(BuildContext context) {
  final productsCubit = context.read<ProductsCubit>();

  if (!productsCubit.isLoaded && !productsCubit.isLoading) {
    productsCubit.getAllProducts();
  }
}

// Load categories if needed
void loadCategoriesIfNeeded(BuildContext context) {
  final categoriesCubit = context.read<CategoriesCubit>();

  if (!categoriesCubit.isLoaded && !categoriesCubit.isLoading) {
    categoriesCubit.getAllCategories();
  }
}
