import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/category_item.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/home_app_bar.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/product_card.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/search_field.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                _buildListViewCategories(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SectionTitle(title: T.current.topSelling),
                ),
                verticalSpace(20),
                _buildListViewProductCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildListViewCategories() {
  return SizedBox(
    height: 100,
    child: ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CategoryItem(
          imageUrl: "asset/icon/Ellipse 1.png",
          name: 'Hoodies',
        );
      },
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return horizontalSpace(10);
      },
    ),
  );
}

Widget _buildListViewProductCard() {
  return SizedBox(
    height: 300.h,
    child: ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      separatorBuilder: (_, __) => horizontalSpace(10),
      itemBuilder: (context, index) {
        return ProductCard(
          image: 'asset/icon/Rectangle 8.png',
          name: 'Men\'s Harrington Jacket',
          price: 148,
          ontap: () {},
        );
      },
    ),
  );
}
