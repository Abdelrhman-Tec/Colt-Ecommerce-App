import 'package:colt_ecommerce_app/core/di/dependency_injection.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/screens/forgot_password_redirect_screen.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/screens/register_screen.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:colt_ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/main_screen.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return _animatedRoute(
          BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.registerScreen:
        return _animatedRoute(
          BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.forgotPasswordScreen:
        return _animatedRoute(
          BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: const ForgotPasswordScreen(),
          ),
        );

      case Routes.forgotPasswordRedirectScreen:
        return _animatedRoute(
          BlocProvider<AuthCubit>(
            create: (context) => getIt<AuthCubit>(),
            child: const ForgotPasswordRedirectScreen(),
          ),
        );

      case Routes.homeScreen:
        return _animatedRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: getIt<ProductsCubit>()),
              BlocProvider.value(value: getIt<CategoriesCubit>()),
            ],
            child: const HomeScreen(),
          ),
        );

      case Routes.mainScreen:
        return _animatedRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: getIt<ProductsCubit>()),
              BlocProvider.value(value: getIt<CategoriesCubit>()),
            ],
            child: const MainScreen(),
          ),
        );

      default:
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _animatedRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }

  static Route<dynamic> _errorRoute(String? name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            'No route defined for "$name"',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
