import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _errorRoute(String? name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
            ' No route defined for "$name"',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
