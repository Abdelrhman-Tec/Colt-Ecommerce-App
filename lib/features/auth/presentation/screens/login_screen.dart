import 'package:colt_ecommerce_app/core/constants/app_strings.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_text_form_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                _Header(textTheme: textTheme),
                verticalSpace(20),
                const _EmailField(),
                verticalSpace(20),
                const _PasswordField(),
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
                _PrimaryButton(onPressed: () {}),
                verticalSpace(10),
                _CreateAccountText(textTheme: textTheme),
                verticalSpace(100),
                _SocialButton(
                  icon: Icons.apple,
                  text: AppStrings.continueWithApple,
                  iconSize: 25,
                  background: theme.colorScheme.primary.withAlpha(30),
                ),
                verticalSpace(10),
                _SocialButton(
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

class _Header extends StatelessWidget {
  final TextTheme textTheme;
  const _Header({required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.signIn,
      style: textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 30.sp,
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return const CustomTextFormField(
      hintText: AppStrings.emailAddress,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _PasswordField extends StatefulWidget {
  const _PasswordField();

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: AppStrings.password,
      obscureText: _obscurePassword,
      suffixIcon: IconButton(
        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        icon: _obscurePassword
            ? const Icon(Icons.visibility_off_outlined, size: 24)
            : const Icon(Icons.visibility_outlined, size: 24),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _PrimaryButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      backgroundColor: AppColors.primary,
      text: AppStrings.continueText,
      textColor: AppColors.lightBackground,
      borderRadius: 50,
      onPressed: onPressed,
    );
  }
}

class _CreateAccountText extends StatefulWidget {
  final TextTheme textTheme;
  const _CreateAccountText({required this.textTheme});

  @override
  State<_CreateAccountText> createState() => _CreateAccountTextState();
}

class _CreateAccountTextState extends State<_CreateAccountText> {
  late final TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()..onTap = () {};
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: AppStrings.dontHaveAccount,
        children: [
          TextSpan(text: AppStrings.createOne, recognizer: _tapRecognizer),
        ],
      ),
      style: widget.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color background;
  final double iconSize;

  const _SocialButton({
    required this.icon,
    required this.text,
    required this.background,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      textColor: Theme.of(context).textTheme.titleLarge!.color!,
      iconSize: iconSize,
      icon: icon,
      backgroundColor: background,
      borderRadius: 50,
      text: text,
      onPressed: () {},
    );
  }
}
