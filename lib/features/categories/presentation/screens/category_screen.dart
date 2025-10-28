import 'package:colt_ecommerce_app/core/function/load_data_if_needed.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/features/categories/data/model/categories_response_model.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/product_card.dart';
import 'package:colt_ecommerce_app/features/products/data/model/products_response_model.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatefulWidget {
  final CategoriesResponseModel category;
  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadProductsIfNeeded(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Category')),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: _buildProductsBloc(widget.category.id),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildProductsBloc(int categoryId) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        state.maybeWhen(
          error: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => SizedBox(
            height: 300.h,
            child: Center(
              child: Image.asset(
                'asset/icon/loading.gif',
                width: 160,
                height: 160,
              ),
            ),
          ),
          success: (products) {
            final productsByCategory = context
                .read<ProductsCubit>()
                .getProductsByCategory(categoryId);
            return _buildGridViewProductCard(productsByCategory);
          },
          error: (message) => SizedBox(
            height: 300.h,
            child: Center(child: Text('Error: $message')),
          ),
          orElse: () => SizedBox(
            height: 300.h,
            child: const Center(child: Text('No products found')),
          ),
        );
      },
    );
  }

  Widget _buildGridViewProductCard(List<ProductsResponseModel> products) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 1 / 1.8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          image: product.images.isNotEmpty ? product.images.first : '',
          name: product.title,
          price: product.price.toDouble(),
          ontap: () => context.pushNamed(
            Routes.productsDetailsScreen,
            arguments: product,
          ),
        );
      },
    );
  }
}
