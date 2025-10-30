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

  // Initialize Firebase
  await firebaseSetup();

  // Initialize Dependency Injection
  await setupGetIt();

  // Initialize Cache
  await CacheHelper.init();

  // Set Stripe Publishable Key
  Stripe.publishableKey = ApiKeys.publishableKey;

  // Check Network Connection
  final networkInfo = getIt<NetworkInfo>();
  final isConnected = await networkInfo.isConnected;
  log('Internet Connected: $isConnected');

  // Determine initial route based on login
  final initialRoute = checkLogin();

  runApp(ColtEcommerceApp(initialRoute: initialRoute));
}
