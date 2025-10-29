import 'dart:developer';
import 'package:colt_ecommerce_app/app.dart';
import 'package:colt_ecommerce_app/core/config/firebase_setup.dart';
import 'package:colt_ecommerce_app/core/connection/network_info.dart';
import 'package:colt_ecommerce_app/core/networking/cache/cache_helper.dart';
import 'package:colt_ecommerce_app/core/di/dependency_injection.dart';
import 'package:colt_ecommerce_app/core/function/check_login.dart';
import 'package:colt_ecommerce_app/core/networking/stripe_service/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseSetup();
  await setupGetIt();
  await CacheHelper.init();
  Stripe.publishableKey = ApiKeys.publishableKey;
  final networkInfo = getIt<NetworkInfo>();
  final isConnected = await networkInfo.isConnected;
  log('🌐 Internet Connected: $isConnected');
  final initialRoute = checkLogin();
  runApp(ColtEcommerceApp(initialRoute: initialRoute));
}
