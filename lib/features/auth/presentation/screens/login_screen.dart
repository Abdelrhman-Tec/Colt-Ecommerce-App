import 'package:colt_ecommerce_app/core/constants/app_strings.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_text_form_filed.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/header.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TapGestureRecognizer _tapRecognizer = TapGestureRecognizer()
    ..onTap = () {};
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 80.h, right: 27.w, left: 27.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(textTheme: textTheme, title: AppStrings.signIn),
                verticalSpace(20),
                const CustomTextFormField(
                  hintText: AppStrings.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                ),
                verticalSpace(20),
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
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.forgotPassword,
                      style: textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                verticalSpace(100),
                CustomButton(
                  backgroundColor: AppColors.primary,
                  text: AppStrings.continueText,
                  textColor: AppColors.lightBackground,
                  borderRadius: 50,
                  onPressed: () {},
                ),
                verticalSpace(10),
                Text.rich(
                  TextSpan(
                    text: AppStrings.dontHaveAccount,
                    children: [
                      TextSpan(
                        text: AppStrings.createOne,
                        recognizer: _tapRecognizer,
                      ),
                    ],
                  ),
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
                ),
                verticalSpace(100),
                SocialButton(
                  icon: Icons.apple,
                  text: AppStrings.continueWithApple,
                  iconSize: 25,
                  background: theme.colorScheme.primary.withAlpha(30),
                ),
                verticalSpace(10),
                SocialButton(
                  icon: Icons.facebook,
                  text: AppStrings.continueWithFacebook,
                  iconSize: 20,
                  background: theme.colorScheme.primary.withAlpha(30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
