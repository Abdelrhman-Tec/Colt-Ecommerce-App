import 'package:colt_ecommerce_app/core/constants/app_strings.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_text_form_filed.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/back_button.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 27.h),
            child: Column(
              children: [
                CustomBackButton(
                  onTap: () => context.pop(),
                  iconPath: "asset/icon/arrowleft2.svg",
                ),
                verticalSpace(30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Header(
                    textTheme: Theme.of(context).textTheme,
                    title: AppStrings.forgotPassword,
                  ),
                ),
                verticalSpace(20),
                // Email
                CustomTextFormField(hintText: AppStrings.emailAddress),
                verticalSpace(20),
                CustomButton(
                  backgroundColor: AppColors.primary,
                  text: AppStrings.continueText,
                  textColor: AppColors.lightBackground,
                  borderRadius: 50,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
