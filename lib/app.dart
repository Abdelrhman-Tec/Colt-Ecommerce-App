import 'package:colt_ecommerce_app/core/config/app_config.dart';
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
          home: const Placeholder(),
        );
      },
    );
  }
}
