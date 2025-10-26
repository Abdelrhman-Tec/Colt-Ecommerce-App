import 'package:colt_ecommerce_app/core/routing/app_route_observer.dart';
import 'package:colt_ecommerce_app/core/routing/app_router.dart';
import 'package:colt_ecommerce_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColtEcommerceApp extends StatelessWidget {
  final String initialRoute;
  const ColtEcommerceApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorObservers: [AppRouteObserver()],
          //Theme setup
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          // Page Route
          onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
          initialRoute: initialRoute,
        );
      },
    );
  }
}
