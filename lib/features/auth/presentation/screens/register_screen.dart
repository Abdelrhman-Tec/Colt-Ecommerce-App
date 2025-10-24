import 'package:colt_ecommerce_app/core/constants/app_strings.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_text_form_filed.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/back_button.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TapGestureRecognizer get _tapRecognizer =>
      TapGestureRecognizer()
        ..onTap = () => context.pushNamed(Routes.forgotPasswordScreen);

  bool obscurePassword = true;
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
                    title: AppStrings.createAccount,
                  ),
                ),
                verticalSpace(20),
                // FirstName
                CustomTextFormField(hintText: AppStrings.firstname),
                verticalSpace(20),
                // LastName
                CustomTextFormField(hintText: AppStrings.lastname),
                verticalSpace(20),
                // Email Adderss
                CustomTextFormField(hintText: AppStrings.emailAddress),
                verticalSpace(20),
                // Password
                CustomTextFormField(
                  hintText: AppStrings.password,

                  obscureText: obscurePassword,
                  suffixIcon: IconButton(
                    onPressed: () =>
                        setState(() => obscurePassword = !obscurePassword),
                    icon: obscurePassword
                        ? const Icon(Icons.visibility_off_outlined, size: 24)
                        : const Icon(Icons.visibility_outlined, size: 24),
                  ),
                ),
                // Register Button
                verticalSpace(50),
                CustomButton(
                  backgroundColor: AppColors.primary,
                  text: AppStrings.continueText,
                  textColor: AppColors.lightBackground,
                  borderRadius: 50,
                  onPressed: () {},
                ),
                verticalSpace(10),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "${AppStrings.forgotPassword}? ",
                      children: [
                        TextSpan(
                          text: AppStrings.reset,
                          recognizer: _tapRecognizer,
                        ),
                      ],
                    ),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
