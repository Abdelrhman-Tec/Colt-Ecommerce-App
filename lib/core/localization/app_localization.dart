import 'package:colt_ecommerce_app/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppLocalization {
  static String translate(String key) {
    return key.tr();
  }

  static Locale get currentLocale =>
      EasyLocalization.of(navigatorKey.currentContext!)!.locale;
  static void changeLocale(BuildContext context, Locale locale) {
    EasyLocalization.of(context)!.setLocale(locale);
  }
}
