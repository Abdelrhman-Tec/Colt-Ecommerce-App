import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBlocListener extends StatelessWidget {
  const AuthBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState<User?>>(
      listenWhen: (previous, current) =>
          current is Loading<User?> ||
          current is Success<User?> ||
          current is Error<User?>,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                child: Image.asset(
                  'asset/icon/loading.gif',
                  width: 160,
                  height: 160,
                ),
              ),
            );
          },
          success: (userCredential) {
            if (Navigator.canPop(context)) context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (message) {
            setupErrorState(context, message);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    if (Navigator.canPop(context)) context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(
          error,
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
