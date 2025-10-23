import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'core/localization/localization_manager.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: LocalizationManager.supportedLocales,
      path: LocalizationManager.path,
      fallbackLocale: LocalizationManager.fallbackLocale,
      child: const ColtEcommerceApp(),
    ),
  );
}
