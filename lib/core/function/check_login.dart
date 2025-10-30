import 'dart:developer';
import 'package:colt_ecommerce_app/core/networking/cache/cache_helper.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';

String checkLogin() {
  final isLoggedIn = CacheHelper.getData(key: 'isLoggedIn') ?? false;
  final uid = CacheHelper.getData(key: 'uid');

  if (isLoggedIn && uid != null && uid.isNotEmpty) {
    log('User is logged in');
    return Routes.mainScreen;
  } else {
    log('User is not logged in');
    return Routes.loginScreen;
  }
}
