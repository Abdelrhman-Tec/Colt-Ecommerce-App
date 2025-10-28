import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
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

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: RegisterBody())),
    );
  }
}

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  TapGestureRecognizer get _tapRecognizer =>
      TapGestureRecognizer()
        ..onTap = () => context.pushNamed(Routes.forgotPasswordScreen);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 27.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBackButton(context),
          verticalSpace(30),
          Header(textTheme: textTheme, title: T.current.createAccount),
          const EmailAndPassword(),
          verticalSpace(50),
          _buildRegisterButton(context),
          verticalSpace(10),
          _buildForgotPasswordText(context),
          const AuthBlocListener(redirectRoute: Routes.loginScreen),
        ],
      ),
    );
  }

  //================ Helper Widgets =================//

  Widget _buildBackButton(BuildContext context) {
    return CustomBackButton(
      onTap: () => context.pop(),
      iconPath: "asset/icon/arrowleft2.svg",
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return CustomButton(
      backgroundColor: AppColors.primary,
      text: T.current.signUp,
      textColor: AppColors.lightBackground,
      borderRadius: 50,
      onPressed: () => _validateThenDoRegister(context),
    );
  }

  Widget _buildForgotPasswordText(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: "${T.current.forgotPassword}? ",
          children: [
            TextSpan(text: T.current.reset, recognizer: _tapRecognizer),
          ],
        ),
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }

  void _validateThenDoRegister(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    if (authCubit.formKey.currentState!.validate()) {
      authCubit.register();
    }
  }
}
