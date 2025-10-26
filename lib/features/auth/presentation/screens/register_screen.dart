import 'package:colt_ecommerce_app/core/constants/app_strings.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/auth_bloc_listener.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/back_button.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/email_and_password.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                EmailAndPassword(),
                // Register Button
                verticalSpace(50),
                CustomButton(
                  backgroundColor: AppColors.primary,
                  text: AppStrings.signUp,
                  textColor: AppColors.lightBackground,
                  borderRadius: 50,
                  onPressed: () {
                    validateThenDoRegister(context);
                  },
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
                AuthBlocListener(redirectRoute: Routes.loginScreen),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void validateThenDoRegister(BuildContext context) {
  final authCubit = context.read<AuthCubit>();
  if (authCubit.formKey.currentState!.validate()) {
    authCubit.register();
  }
}
