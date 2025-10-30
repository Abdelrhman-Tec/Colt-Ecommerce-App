import 'package:colt_ecommerce_app/core/di/dependency_injection.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/screens/forgot_password_redirect_screen.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/screens/register_screen.dart';
import 'package:colt_ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:colt_ecommerce_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:colt_ecommerce_app/features/categories/data/model/categories_response_model.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/screens/all_categories_screen.dart';
import 'package:colt_ecommerce_app/features/categories/presentation/screens/category_screen.dart';
import 'package:colt_ecommerce_app/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:colt_ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:colt_ecommerce_app/features/home/presentation/widget/main_screen.dart';
import 'package:colt_ecommerce_app/features/products/data/model/products_response_model.dart';
import 'package:colt_ecommerce_app/features/products/presentation/cubit/products_cubit.dart';
import 'package:colt_ecommerce_app/features/products/presentation/screens/all_products_screen.dart';
import 'package:colt_ecommerce_app/features/products/presentation/screens/product_details_screen.dart';
import 'package:colt_ecommerce_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:colt_ecommerce_app/features/support/presentation/screens/support_screen.dart';
import 'package:colt_ecommerce_app/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:colt_ecommerce_app/features/wishlist/presentation/screens/wishlist_screen.dart';
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
              BlocProvider.value(value: getIt<WishlistCubit>()),
              BlocProvider.value(value: getIt<AuthCubit>()),
              BlocProvider.value(value: getIt<CartCubit>()),
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
              BlocProvider.value(value: getIt<WishlistCubit>()),
              BlocProvider.value(value: getIt<AuthCubit>()),
              BlocProvider.value(value: getIt<CartCubit>()),
              BlocProvider.value(value: getIt<ProductsCubit>()),
              BlocProvider.value(value: getIt<CategoriesCubit>()),
            ],
            child: const MainScreen(),
          ),
        );
      case Routes.categoriesDetailsScreen:
        return _animatedRoute(
          BlocProvider.value(
            value: getIt<ProductsCubit>(),
            child: CategoryScreen(
              category: settings.arguments as CategoriesResponseModel,
            ),
          ),
        );

      case Routes.allCategoriesScreen:
        return _animatedRoute(
          BlocProvider.value(
            value: getIt<CategoriesCubit>(),
            child: const AllCategoriesScreen(),
          ),
        );

      case Routes.allProductsScreen:
        return _animatedRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: getIt<CategoriesCubit>()),
              BlocProvider.value(value: getIt<ProductsCubit>()),
              BlocProvider.value(value: getIt<CartCubit>()),
            ],
            child: const AllProductsScreen(),
          ),
        );

      case Routes.productsDetailsScreen:
        return _animatedRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider.value(value: getIt<ProductsCubit>()),
              BlocProvider.value(value: getIt<CartCubit>()),
            ],
            child: ProductDetailsScreen(
              product: settings.arguments as ProductsResponseModel,
            ),
          ),
        );

      case Routes.cartScreen:
        return _animatedRoute(
          BlocProvider.value(
            value: getIt<CartCubit>(),
            child: const CartScreen(),
          ),
        );
      case Routes.profileScreen:
        return _animatedRoute(
          BlocProvider.value(
            value: getIt<AuthCubit>(),
            child: const ProfileScreen(),
          ),
        );

      case Routes.checkOut:
        return _animatedRoute(
          BlocProvider.value(
            value: getIt<CartCubit>(),
            child: const CheckoutScreen(),
          ),
        );
      case Routes.wishlist:
        return _animatedRoute(
          BlocProvider.value(
            value: getIt<WishlistCubit>(),
            child: const WishlistScreen(),
          ),
        );
      case Routes.supportScreen:
        return _animatedRoute(const SupportScreen());
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
