// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StripePaymentIntentModel _$StripePaymentIntentModelFromJson(
  Map<String, dynamic> json,
) => StripePaymentIntentModel(
  id: json['id'] as String,
  object: json['object'] as String,
  amount: (json['amount'] as num).toInt(),
  currency: json['currency'] as String,
  status: json['status'] as String,
  client_secret: json['client_secret'] as String,
  created: (json['created'] as num?)?.toInt(),
  description: json['description'] as String?,
  payment_method_types: (json['payment_method_types'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  payment_method_options: json['payment_method_options'] == null
      ? null
      : PaymentMethodOptions.fromJson(
          json['payment_method_options'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$StripePaymentIntentModelToJson(
  StripePaymentIntentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'amount': instance.amount,
  'currency': instance.currency,
  'status': instance.status,
  'client_secret': instance.client_secret,
  'created': instance.created,
  'description': instance.description,
  'payment_method_types': instance.payment_method_types,
  'payment_method_options': instance.payment_method_options,
};

PaymentMethodOptions _$PaymentMethodOptionsFromJson(
  Map<String, dynamic> json,
) => PaymentMethodOptions(
  card: json['card'] == null
      ? null
      : CardOptions.fromJson(json['card'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaymentMethodOptionsToJson(
  PaymentMethodOptions instance,
) => <String, dynamic>{'card': instance.card};

CardOptions _$CardOptionsFromJson(Map<String, dynamic> json) => CardOptions(
  request_three_d_secure: json['request_three_d_secure'] as String?,
);

Map<String, dynamic> _$CardOptionsToJson(CardOptions instance) =>
    <String, dynamic>{
      'request_three_d_secure': instance.request_three_d_secure,
    };
