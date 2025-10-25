import 'package:colt_ecommerce_app/core/constants/app_strings.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordRedirectScreen extends StatelessWidget {
  const ForgotPasswordRedirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("asset/icon/sent_email.png", width: 150.w),
              ),
              verticalSpace(25),
              Text(
                AppStrings.weSentYouEmail,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(25),
              CustomButton(
                width: 220,
                backgroundColor: AppColors.primary,
                text: AppStrings.returnToLogin,
                textColor: AppColors.lightBackground,
                borderRadius: 50,
                onPressed: () =>
                    context.pushReplacementNamed(Routes.loginScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
