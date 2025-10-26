import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/app_regex.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_text_form_filed.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/auth_bloc_listener.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/back_button.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(
                  onTap: () => context.pop(),
                  iconPath: "asset/icon/arrowleft2.svg",
                ),
                verticalSpace(30),
                Header(
                  textTheme: Theme.of(context).textTheme,
                  title: T.current.forgotPassword,
                ),
                verticalSpace(20),
                // Email
                Form(
                  key: context.read<AuthCubit>().formKey,
                  child: CustomTextFormField(
                    controller: context.read<AuthCubit>().emailController,
                    hintText: T.current.emailAddress,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return T.current.pleaseEnterYourEmail;
                      } else if (!AppRegex.isEmailValid(value)) {
                        return T.current.pleaseEnterValidEmail;
                      }
                      return null;
                    },
                  ),
                ),

                verticalSpace(20),
                CustomButton(
                  backgroundColor: AppColors.primary,
                  text: T.current.signIn,
                  textColor: AppColors.lightBackground,
                  borderRadius: 50,
                  onPressed: () {
                    validateThenDoForgotPasswordEmail(context);
                  },
                ),
                AuthBlocListener(
                  redirectRoute: Routes.forgotPasswordRedirectScreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void validateThenDoForgotPasswordEmail(BuildContext context) {
  final authCubit = context.read<AuthCubit>();
  if (authCubit.formKey.currentState!.validate()) {
    authCubit.resetPassword();
  }
}
