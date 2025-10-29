import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'stripe_constants.dart';
import 'model/stripe_response_model.dart';
part 'stripe_service.g.dart';

@RestApi(baseUrl: StripeConstants.baseUrl)
abstract class StripeService {
  factory StripeService(Dio dio, {String? baseUrl}) = _StripeService;

  @POST(StripeConstants.paymentIntents)
  @FormUrlEncoded()
  Future<StripePaymentIntentModel> createPaymentIntent(
    @Field("amount") int amount,
    @Field("currency") String currency,
  @Field("payment_method_types[0]") String paymentMethodType0,
  );
}
