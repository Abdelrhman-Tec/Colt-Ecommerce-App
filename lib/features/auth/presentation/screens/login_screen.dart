import 'package:colt_ecommerce_app/core/generated/l10n/cubit/language_cubit.dart';
import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/core/theme/cubit/theme_cubit.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/core/widgets/language_Toggle_Button.dart';
import 'package:colt_ecommerce_app/core/widgets/theme_toggle_button.dart';
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

  @override
  Widget build(BuildContext context) {
    return _loginBody();
  }

  Widget _loginBody() {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 80.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderRow(context),
              verticalSpace(30),
              Header(textTheme: textTheme, title: T.current.signIn),
              const EmailAndPassword(),
              _buildForgotPasswordButton(context, textTheme),
              verticalSpace(100),
              _buildLoginButton(context),
              verticalSpace(10),
              _buildRegisterText(context),
              verticalSpace(50),
              _buildSocialLoginButton(context),
              verticalSpace(40),
              const AuthBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  //================ Helper Widgets =================//

  Widget _buildHeaderRow(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final languageCubit = context.watch<LanguageCubit>();

    return Row(
      children: [
        ThemeToggleButton(
          isLightMode: themeCubit.state.themeMode == ThemeMode.light,
          onToggle: themeCubit.toggleTheme,
        ),
        horizontalSpace(20),
        LanguageToggleButton(
          isEnglish: languageCubit.state.locale.languageCode == 'en',
          onToggle: languageCubit.toggleLanguage,
        ),
      ],
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context, TextTheme textTheme) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () => context.pushNamed(Routes.forgotPasswordScreen),
        child: Text(
          T.current.forgotPassword,
          style: textTheme.displaySmall!.copyWith(fontSize: 18.sp),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomButton(
      backgroundColor: AppColors.primary,
      text: T.current.signIn,
      textColor: AppColors.lightBackground,
      borderRadius: 50,
      onPressed: () => _validateThenDoLogin(context),
    );
  }

  Widget _buildRegisterText(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: T.current.dontHaveAccount,
          children: [
            TextSpan(text: T.current.createOne, recognizer: _tapRecognizer),
          ],
        ),
        style: Theme.of(
          context,
        ).textTheme.displaySmall!.copyWith(fontSize: 14.sp),
      ),
    );
  }

  Widget _buildSocialLoginButton(BuildContext context) {
    final theme = Theme.of(context);
    return SocialButton(
      ontap: () => context.read<AuthCubit>().loginWithFacebook(),
      icon: Icons.facebook,
      text: T.current.continueWithFacebook,
      iconSize: 20,
      background: theme.colorScheme.primary.withAlpha(30),
    );
  }

  void _validateThenDoLogin(BuildContext context) {
    if (context.read<AuthCubit>().formKey.currentState!.validate()) {
      context.read<AuthCubit>().login();
    }
  }
}
