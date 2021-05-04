import 'package:mercadopago_transparent/src/card/card_repository.dart';
import 'package:mercadopago_transparent/src/client/client_repository.dart';
import 'package:mercadopago_transparent/src/payment/payment_repository.dart';
import 'package:mercadopago_transparent/src/subscriptions/subscriptions_repository.dart';

class MercadoPago {
  final String acessToken;
  final String publicKey;
  final String applicationId;

  late final CardRepository card;
  late final ClientRepository client;
  late final PaymentRepository payment;
  late final SubscriptionsRepository subscriptions;

  MercadoPago({required this.acessToken, required this.publicKey, required this.applicationId}) {
    card = CardRepository(acessToken: acessToken);
    client = ClientRepository(acessToken: acessToken);
    payment = PaymentRepository(acessToken: acessToken);
    subscriptions = SubscriptionsRepository(acessToken: acessToken);
  }
}
