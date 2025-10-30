import 'package:colt_ecommerce_app/core/function/load_data_if_needed.dart';
import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/back_button.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/header.dart';
import 'package:colt_ecommerce_app/features/categories/data/model/categories_response_model.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_state.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/widget/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadCategoriesIfNeeded(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 63.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackButton(context),
              verticalSpace(20),
              Header(
                textTheme: Theme.of(context).textTheme,
                title: T.current.shopByCategories,
              ),

              verticalSpace(20),
              Expanded(child: _buildCategoriesBloc()),
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
        loading: () => Center(
          child: Image.asset('asset/icon/loading.gif', width: 160, height: 160),
        ),
        success: (categories) =>
            _buildCategoriesWithShowMore(categories, initialCount: 5),
        error: (message) =>
            Center(child: Text('Error: $message', textAlign: TextAlign.center)),
        orElse: () => const Center(child: Text('No categories found')),
      );
    },
  );
}

Widget _buildCategoriesWithShowMore(
  List<CategoriesResponseModel> categories, {
  int initialCount = 5,
}) {
  final ValueNotifier<bool> showAll = ValueNotifier(false);

  return ValueListenableBuilder<bool>(
    valueListenable: showAll,
    builder: (context, value, _) {
      final displayedCategories = value
          ? categories
          : categories.take(initialCount).toList();

      return ListView.separated(
        padding: EdgeInsets.zero,
        itemCount:
            displayedCategories.length +
            (categories.length > initialCount ? 1 : 0),
        separatorBuilder: (_, __) => verticalSpace(20),
        itemBuilder: (context, index) {
          if (index == displayedCategories.length) {
            // Show More / Less button
            return Center(
              child: TextButton(
                onPressed: () => showAll.value = !showAll.value,
                child: Text(
                  value ? T.current.showLess : T.current.showMore,
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            );
          }

          final category = displayedCategories[index];
          return CategoryCard(
            title: category.name,
            imageUrl: category.image,
            onTap: () => context.pushNamed(
              Routes.categoriesDetailsScreen,
              arguments: category,
            ),
          );
        },
      );
    },
  );
}
