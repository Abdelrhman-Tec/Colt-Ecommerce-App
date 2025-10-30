import 'package:colt_ecommerce_app/core/function/load_data_if_needed.dart';
import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/features/categories/data/model/categories_response_model.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_state.dart';
import 'package:colt_ecommerce_app/features/products/data/model/products_response_model.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/category_item.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/home_app_bar.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/product_card.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/search_field.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/section_title.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadProductsIfNeeded(context);
      loadCategoriesIfNeeded(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildHomeBody();
  }

  Widget buildHomeBody() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 63.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App Bar
              buildSection(child: const HomeAppBar()),
              // Search Field
              buildSection(child: const SearchField()),
              // Categories Section
              buildSection(
                child: SectionTitle(
                  title: T.current.categories,
                  ontap: () => context.pushNamed(Routes.allCategoriesScreen),
                ),
              ),
              _buildCategoriesBloc(),
              verticalSpace(20),
              // Products Section
              buildSection(
                child: SectionTitle(
                  title: T.current.product,
                  ontap: () => context.pushNamed(Routes.allProductsScreen),
                ),
              ),
              _buildProductsBloc(),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSection({
    required Widget child,
    double horizontalPadding = 20,
    double verticalSpaceAfter = 20,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w),
          child: child,
        ),
        verticalSpace(verticalSpaceAfter),
      ],
    );
  }

  Widget _buildCategoriesBloc() {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
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
            height: 100,
            child: Center(
              child: Image.asset(
                'asset/icon/loading.gif',
                width: 160,
                height: 160,
              ),
            ),
          ),
          success: (categories) => _buildListViewCategories(categories),
          error: (message) => SizedBox(
            height: 100,
            child: Center(child: Text('Error: $message')),
          ),
          orElse: () => const SizedBox(
            height: 100,
            child: Center(child: Text('No categories found')),
          ),
        );
      },
    );
  }

  Widget _buildProductsBloc() {
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
          success: (products) => _buildListViewProductCard(products),
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

  Widget _buildListViewCategories(List<CategoriesResponseModel> categories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(
            imageUrl: category.image,
            name: category.name,
            ontap: () => context.pushNamed(
              Routes.categoriesDetailsScreen,
              arguments: category,
            ),
          );
        },
        separatorBuilder: (_, __) => horizontalSpace(10),
      ),
    );
  }

  Widget _buildListViewProductCard(List<ProductsResponseModel> products) {
    return SizedBox(
      height: 300.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => horizontalSpace(10),
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            image: product.images.isNotEmpty ? product.images.first : '',
            name: product.title,
            price: product.price.toDouble(),
            onTap: () => context.pushNamed(
              Routes.productsDetailsScreen,
              arguments: product,
            ),
            product: product,
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
