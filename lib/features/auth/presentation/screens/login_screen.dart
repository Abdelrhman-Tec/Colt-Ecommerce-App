import 'package:colt_ecommerce_app/core/constants/app_strings.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 80.h, right: 27.w, left: 27.w),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.signIn,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 30.sp,
                    ),
                  ),
                ),
                verticalSpace(20),
                CustomTextFormField(
                  hintText: AppStrings.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                ),
                verticalSpace(20),
                CustomTextFormField(
                  hintText: AppStrings.password,
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: obscureText
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
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                    children: [TextSpan(text: AppStrings.createOne)],
                  ),
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
                ),
                verticalSpace(100),
                CustomButton(
                  textColor: Theme.of(context).textTheme.titleLarge!.color!,
                  iconSize: 25,
                  icon: Icons.apple,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary.withAlpha(30),
                  borderRadius: 50,
                  text: "Continue With Apple",
                  onPressed: () {},
                ),
                verticalSpace(10),

                verticalSpace(10),
                CustomButton(
                  textColor: Theme.of(context).textTheme.titleLarge!.color!,
                  iconSize: 20,
                  icon: Icons.facebook,

                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary.withAlpha(30),
                  borderRadius: 50,
                  text: "Continue With Facebook",
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
