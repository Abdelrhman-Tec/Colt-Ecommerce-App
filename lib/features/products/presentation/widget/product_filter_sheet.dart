import 'package:colt_ecommerce_app/core/widgets/custom_text_form_filed.dart';
import 'package:colt_ecommerce_app/features/categories/data/model/categories_response_model.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';

class ProductFilterSheet extends StatefulWidget {
  const ProductFilterSheet({super.key});

  @override
  State<ProductFilterSheet> createState() => _ProductFilterSheetState();
}

class _ProductFilterSheetState extends State<ProductFilterSheet> {
  String title = '';
  double minPrice = 0;
  double maxPrice = 1000;
  final List<int> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // Filter by Title
          Text(
            T.current.filterByTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 10.h),
          CustomTextFormField(
            onChanged: (value) => title = value,
            hintText: T.current.enterTitle,
          ),

          SizedBox(height: 15.h),
          // Filter by Price Range
          Text(
            T.current.filterByPriceRange,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          RangeSlider(
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).highlightColor,
            values: RangeValues(minPrice, maxPrice),
            min: 0,
            max: 1000,
            divisions: 20,
            labels: RangeLabels("\$$minPrice", "\$$maxPrice"),
            onChanged: (range) {
              setState(() {
                minPrice = range.start;
                maxPrice = range.end;
              });
            },
          ),

          SizedBox(height: 15.h),
          // Filter by Category
          Text(
            T.current.filterByCategory,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 10.h),
          BlocBuilder<
            CategoriesCubit,
            CategoriesState<List<CategoriesResponseModel>>
          >(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => Center(
                  child: Image.asset(
                    'asset/icon/loading.gif',
                    width: 160,
                    height: 160,
                  ),
                ),
                success: (categories) {
                  return Wrap(
                    spacing: 10.w,
                    children: categories.map((category) {
                      final isSelected = selectedCategories.contains(
                        category.id,
                      );
                      return ChoiceChip(
                        label: Text(category.name),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedCategories.add(category.id);
                            } else {
                              selectedCategories.remove(category.id);
                            }
                          });
                        },
                      );
                    }).toList(),
                  );
                },
                error: (message) => Text(message),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),

          SizedBox(height: 20.h),
          Center(
            child: CustomButton(
              text: T.current.applyFilters,
              backgroundColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              width: 170.w,
              height: 55.h,
              borderRadius: 25,
              onPressed: () {
                final filteredProducts = context
                    .read<ProductsCubit>()
                    .filterProducts(
                      title: title,
                      minPrice: minPrice,
                      maxPrice: maxPrice,
                      categoryIds: selectedCategories,
                    );
                Navigator.pop(context, filteredProducts);
              },
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
