import 'package:colt_ecommerce_app/app.dart';
import 'package:colt_ecommerce_app/core/config/firebase_setup.dart';
import 'package:flutter/material.dart';

void main() {
  firebaseSetup();
  runApp(const ColtEcommerceApp());
}
