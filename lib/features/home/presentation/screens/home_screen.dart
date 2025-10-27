import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/features/home/data/model/categories_response_model.dart';
import 'package:colt_ecommerce_app/features/home/data/model/home_data.dart';
import 'package:colt_ecommerce_app/features/home/data/model/products_response_model.dart';
import 'package:colt_ecommerce_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/category_item.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/home_app_bar.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/product_card.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/search_field.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/section_title.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<HomeCubit>();
      if (cubit.state is! Success) {
        cubit.gethAllData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 63.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const HomeAppBar(),
                ),
                verticalSpace(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SearchField(),
                ),
                verticalSpace(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SectionTitle(title: T.current.categories),
                ),
                verticalSpace(20),
                buildCategoriesBloc(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SectionTitle(title: T.current.product),
                ),
                verticalSpace(20),
                buildProductsBloc(),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategoriesBloc() {
    return BlocConsumer<HomeCubit, HomeState<HomeData>>(
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
                width: 150,
                height: 150,
              ),
            ),
          ),
          success: (homeData) => _buildListViewCategories(homeData.categories),
          error: (message) => SizedBox(
            height: 100,
            child: Center(child: Text('Error: $message')),
          ),
          orElse: () =>
              SizedBox(height: 100, child: Center(child: Text('Welcome!'))),
        );
      },
    );
  }

  Widget buildProductsBloc() {
    return BlocConsumer<HomeCubit, HomeState<HomeData>>(
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
                width: 150,
                height: 150,
              ),
            ),
          ),
          success: (homeData) => _buildListViewProductCard(homeData.products),
          error: (message) => SizedBox(
            height: 300.h,
            child: Center(child: Text('Error: $message')),
          ),
          orElse: () => SizedBox(
            height: 300.h,
            child: Center(child: Text('Welcome!')),
          ),
        );
      },
    );
  }

  Widget _buildListViewCategories(List<CategoriesResponseModel> categories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(imageUrl: category.imageUrl, name: category.name);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 10);
        },
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
            ontap: () {},
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
