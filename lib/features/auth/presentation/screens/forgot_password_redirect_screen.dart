import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                 T.current.weSentYouEmail,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(25),
              CustomButton(
                width: 220,
                backgroundColor: AppColors.primary,
                text: T.current.returnToLogin,
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
