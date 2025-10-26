// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:colt_ecommerce_app/core/databases/cache/cache_helper.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';

String checkLogin() {
  final isLoggedIn = CacheHelper.getData(key: 'isLoggedIn') ?? false;

  if (isLoggedIn) {
    log('User is logged in');
    return Routes.homeScreen;
  } else {
    log('User is not logged in');
    return Routes.loginScreen;
  }
}
