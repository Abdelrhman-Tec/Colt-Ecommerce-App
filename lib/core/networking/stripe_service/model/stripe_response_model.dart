import 'package:json_annotation/json_annotation.dart';
part 'stripe_response_model.g.dart';

@JsonSerializable()
class StripePaymentIntentModel {
  final String id;
  final String object;
  final int amount;
  final String currency;
  final String status;
  final String client_secret;
  final int? created;
  final String? description;
  final List<String>? payment_method_types;
  final PaymentMethodOptions? payment_method_options;

  StripePaymentIntentModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.currency,
    required this.status,
    required this.client_secret,
    this.created,
    this.description,
    this.payment_method_types,
    this.payment_method_options,
  });

  factory StripePaymentIntentModel.fromJson(Map<String, dynamic> json) =>
      _$StripePaymentIntentModelFromJson(json);

  Map<String, dynamic> toJson() => _$StripePaymentIntentModelToJson(this);
}

@JsonSerializable()
class PaymentMethodOptions {
  final CardOptions? card;

  PaymentMethodOptions({this.card});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodOptionsToJson(this);
}

@JsonSerializable()
class CardOptions {
  final String? request_three_d_secure;

  CardOptions({this.request_three_d_secure});

  factory CardOptions.fromJson(Map<String, dynamic> json) =>
      _$CardOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$CardOptionsToJson(this);
}
