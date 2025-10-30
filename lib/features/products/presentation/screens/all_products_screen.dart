import 'package:colt_ecommerce_app/core/function/load_data_if_needed.dart';
import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/back_button.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/header.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/product_card.dart';
import 'package:colt_ecommerce_app/features/products/data/model/products_response_model.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen>
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackButton(context),
              verticalSpace(20),
              Header(
                textTheme: Theme.of(context).textTheme,
                title: T.current.shopByProducts,
              ),
              verticalSpace(20),
              Expanded(child: _buildProductsBloc()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Widget _buildBackButton(BuildContext context) {
  return CustomBackButton(
    onTap: () => context.pop(),
    iconPath: "asset/icon/arrowleft2.svg",
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
        loading: () => Center(
          child: Image.asset('asset/icon/loading.gif', width: 160, height: 160),
        ),
        success: (products) =>
            _buildProductsWithShowMore(products, initialCount: 6),
        error: (message) =>
            Center(child: Text('Error: $message', textAlign: TextAlign.center)),
        orElse: () => const Center(child: Text('No products found')),
      );
    },
  );
}

Widget _buildProductsWithShowMore(
  List<ProductsResponseModel> products, {
  int initialCount = 6,
}) {
  final ValueNotifier<bool> showAll = ValueNotifier(false);

  return ValueListenableBuilder<bool>(
    valueListenable: showAll,
    builder: (context, value, _) {
      final displayedProducts = value
          ? products
          : products.take(initialCount).toList();

      return Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 15.w,
                childAspectRatio: 1 / 1.7,
              ),
              itemCount: displayedProducts.length,
              itemBuilder: (context, index) {
                final product = displayedProducts[index];
                return ProductCard(
                  image: product.images.first,
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
          ),
          if (products.length > initialCount)
            TextButton(
              onPressed: () => showAll.value = !showAll.value,
              child: Text(
                value ? T.current.showLess : T.current.showMore,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
        ],
      );
    },
  );
}
