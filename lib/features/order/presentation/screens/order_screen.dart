import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: T.current.order, showIcon: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("asset/icon/check.png", width: 150.w)),
              verticalSpace(25),
              Text(
                T.current.noOrdersYet,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(25),
              CustomButton(
                width: 220,
                backgroundColor: AppColors.primary,
                text: T.current.exploreCategories,
                textColor: AppColors.lightBackground,
                borderRadius: 50,
                onPressed: () => context.pushNamed(Routes.allCategoriesScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
