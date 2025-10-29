import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'stripe_service.dart';

abstract class StripeManager {
  static Future<String> makePayment(int amount, String currency) async {
    try {
      final stripeService = GetIt.instance<StripeService>();
      final response = await stripeService.createPaymentIntent(
        amount * 100,
        currency,
        'card',
      );
      return response.client_secret;
    } catch (e, s) {
      log('Stripe Error: $e', stackTrace: s);
      return '';
    }
  }

  static Future<String> makePaymentWithMethod(
    int amount,
    String currency,
    String paymentMethod,
  ) async {
    try {
      final stripeService = GetIt.instance<StripeService>();
      final response = await stripeService.createPaymentIntent(
        amount * 100,
        currency,
        paymentMethod,
      );
      return response.client_secret;
    } catch (e, s) {
      log('Stripe Error: $e', stackTrace: s);
      return '';
    }
  }

  static Future<void> initializePaymentSheet(
    String clientSecret, {
    String? merchantName,
  }) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: merchantName ?? "Abdelrhman",
        ),
      );
    } catch (e, s) {
      log('Error initializing PaymentSheet: $e', stackTrace: s);
    }
  }

  static Future<void> presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e, s) {
      log('Error presenting PaymentSheet: $e', stackTrace: s);
    }
  }
}
