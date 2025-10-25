import 'package:colt_ecommerce_app/app.dart';
import 'package:colt_ecommerce_app/core/config/firebase_setup.dart';
import 'package:colt_ecommerce_app/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseSetup();
  await setupGetIt();

  runApp(const ColtEcommerceApp());
}
