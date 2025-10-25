import 'package:colt_ecommerce_app/core/constants/app_strings.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/auth_bloc_listener.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/email_and_password.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/header.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TapGestureRecognizer get _tapRecognizer =>
      TapGestureRecognizer()
        ..onTap = () => context.pushNamed(Routes.registerScreen);
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
                EmailAndPassword(),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () =>
                        context.pushNamed(Routes.forgotPasswordScreen),
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
                  onPressed: () {
                    validateThenDoLogin(context);
                  },
                ),
                verticalSpace(10),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: AppStrings.dontHaveAccount,
                      children: [
                        TextSpan(
                          text: AppStrings.createOne,
                          recognizer: _tapRecognizer,
                        ),
                      ],
                    ),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                verticalSpace(50),
                SocialButton(
                  ontap: () {
                    context.read<AuthCubit>().loginWithFacebook();
                  },
                  icon: Icons.facebook,
                  text: AppStrings.continueWithFacebook,
                  iconSize: 20,
                  background: theme.colorScheme.primary.withAlpha(30),
                ),
                verticalSpace(40),
                AuthBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<AuthCubit>().formKey.currentState!.validate()) {
    context.read<AuthCubit>().login();
  }
}
