import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/routing/app_route_observer.dart';
import 'package:colt_ecommerce_app/core/routing/app_router.dart';
import 'package:colt_ecommerce_app/core/theme/dark_theme.dart';
import 'package:colt_ecommerce_app/core/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
          locale: Locale("en"),
          localizationsDelegates: [
            T.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: T.delegate.supportedLocales,

          debugShowCheckedModeBanner: false,
          navigatorObservers: [AppRouteObserver()],
          //Theme setup
          theme: LightTheme.theme(context),
          darkTheme: DarkTheme.theme(context),
          themeMode: ThemeMode.light,
          // Page Route
          onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
          initialRoute: initialRoute,
        );
      },
    );
  }
}
