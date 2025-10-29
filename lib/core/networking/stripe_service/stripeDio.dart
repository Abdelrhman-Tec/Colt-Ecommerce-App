import 'package:colt_ecommerce_app/core/networking/stripe_service/api_keys.dart';
import 'package:dio/dio.dart';
import 'stripe_constants.dart';

class StripeDio {
  static final StripeDio _instance = StripeDio._internal();

  late final Dio dio;

  factory StripeDio() {
    return _instance;
  }

  StripeDio._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: StripeConstants.baseUrl,
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );
  }
}
