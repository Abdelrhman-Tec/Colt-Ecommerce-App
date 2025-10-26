import 'package:colt_ecommerce_app/app.dart';
import 'package:colt_ecommerce_app/core/config/firebase_setup.dart';
import 'package:colt_ecommerce_app/core/databases/cache/cache_helper.dart';
import 'package:colt_ecommerce_app/core/di/dependency_injection.dart';
import 'package:colt_ecommerce_app/core/function/check_login.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseSetup();
  await setupGetIt();
  await CacheHelper.init();
  final initialRoute = checkLogin();
  runApp(ColtEcommerceApp(initialRoute: initialRoute));
}
