import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LocalizationManager {
  static const supportedLocales = [Locale('en'), Locale('ar')];

  static const path = 'lib/core/localization';

  static const fallbackLocale = Locale('en');

  static Future<void> changeLocale(BuildContext context, Locale locale) async {
    await context.setLocale(locale);
  }
}
