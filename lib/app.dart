import 'package:colt_ecommerce_app/core/config/app_config.dart';
import 'package:colt_ecommerce_app/core/routing/app_route_observer.dart';
import 'package:colt_ecommerce_app/core/routing/app_router.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColtEcommerceApp extends StatelessWidget {
  const ColtEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Colt Ecommerce',
          debugShowCheckedModeBanner: false,
          navigatorObservers: [AppRouteObserver()],
          //Theme setup
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,

          //Localization setup
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          //Navigator key
          navigatorKey: navigatorKey,

          // Page Route
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: Routes.loginScreen,

          home: Scaffold(),
        );
      },
    );
  }
}
