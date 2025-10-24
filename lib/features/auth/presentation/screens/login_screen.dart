import 'package:colt_ecommerce_app/core/constants/app_strings.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/custom_text_form_filed.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.signIn,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 30.sp,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
