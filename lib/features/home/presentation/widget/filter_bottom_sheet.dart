import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:colt_ecommerce_app/features/categories/data/model/categories_response_model.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<String> selectedCategories = [];

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
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (categories) {
                  return Wrap(
                    spacing: 10.w,
                    children: categories.map((category) {
                      final isSelected = selectedCategories.contains(
                        category.name,
                      );
                      return ChoiceChip(
                        label: Text(category.name),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedCategories.add(category.name);
                            } else {
                              selectedCategories.remove(category.name);
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
              backgroundColor: Theme.of(context).primaryColor,
              text: T.current.applyFilters,
              onPressed: () {
                Navigator.pop(context, selectedCategories);
              },
              textColor: Colors.white,
              width: 170.w,
              height: 55.h,
              borderRadius: 25,
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
