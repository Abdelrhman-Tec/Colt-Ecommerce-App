import 'package:colt_ecommerce_app/core/helpers/app_regex.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_text_form_filed.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  late TextEditingController emailController;
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<AuthCubit>();
    passwordController = cubit.passwordController;
    emailController = cubit.emailController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        final text = passwordController.text;
        hasLowercase = AppRegex.hasLowerCase(text);
        hasUppercase = AppRegex.hasUpperCase(text);
        hasNumber = AppRegex.hasNumber(text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(text);
        hasMinLength = AppRegex.hasMinLength(text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          verticalSpace(25),
          CustomTextFormField(
            hintText: 'Email',
            obscureText: false,
            controller: emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          verticalSpace(17),
          CustomTextFormField(
            hintText: 'Password',
            obscureText: obscurePassword,
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            suffixIcon: IconButton(
              onPressed: () =>
                  setState(() => obscurePassword = !obscurePassword),
              icon: obscurePassword
                  ? const Icon(Icons.visibility_off_outlined, size: 24)
                  : const Icon(Icons.visibility_outlined, size: 24),
            ),
          ),
          verticalSpace(15),
          if (passwordController.text.isNotEmpty) ...[
            PasswordValidation(
              hasLowercase: hasLowercase,
              hasUppercase: hasUppercase,
              hasNumber: hasNumber,
              hasSpecialCharacter: hasSpecialCharacter,
              hasMinLength: hasMinLength,
            ),
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
