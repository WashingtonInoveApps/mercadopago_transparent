import 'package:flutter_test/flutter_test.dart';
import 'package:mercadopago_transparent/mercadopago_transparent.dart';

void main() {
  final mercado =
      MercadoPago(acessToken: ' ', publicKey: '', applicationId: '');

  test('test get card', () async {
    expect(await mercado.card.get(id: '35173ccf116da88ef3adb6e9d3feb900'),
        isInstanceOf<Card>());
  });

  test('test card token', () async {
    expect(
        await mercado.card.token(
            cardName: '',
            cpf: '',
            cardNumber: '',
            expirationMoth: 11,
            expirationYear: 2025,
            securityCode: '123',
            issuer: 'master'),
        isInstanceOf<String>());
  });

  test('test client create', () async {
    final client = Client(firstName: '', email: '', docNumber: '', phone: '');

    expect(await mercado.client.create(client: client), isInstanceOf<String>());
  });

  test('test client delete', () async {
    expect(await mercado.client.delete(id: ''), isInstanceOf<String>());
  });

  test('test client savecard', () async {
    expect(await mercado.client.savecard(clientId: '', token: ''),
        isInstanceOf<String>());
  });

  test('test token with card', () async {
    expect(await mercado.card.tokenWithCard(cardId: '', securityCode: ''),
        isInstanceOf<String>());
  });

  test('test client get', () async {
    expect(await mercado.client.get(email: ''), isInstanceOf<Client>());
  });

  test('test payment credit card', () async {
    expect(
        await mercado.payment.creditCard(
            tokenCard:
                await mercado.card.tokenWithCard(cardId: '', securityCode: ''),
            clientId: '',
            valor: 100),
        isInstanceOf<Payment>());
  });

  test('test payment get', () async {
    expect(await mercado.payment.get(id: ''), isInstanceOf<Payment>());
  });

  test('test payment methods', () async {
    expect(await mercado.payment.paymentMethods(),
        isInstanceOf<List<MethodsPayment>>());
  });

  test('test payment boleto', () async {
    expect(await mercado.payment.ticket(name: "", email: "", docNumber: ""),
        isInstanceOf<Payment>());
  });

  test('test payment pix', () async {
    expect(
        await mercado.payment
            .pix(name: " ", email: "", clientId: "", docNumber: ""),
        isInstanceOf<Payment>());
  });

  test('test subscription create', () async {
    expect(
        await mercado.subscriptions.create(
            description: 'Teste',
            email: '',
            token: await mercado.card.token(
                cardName: '',
                cpf: '',
                cardNumber: '',
                expirationMoth: 1,
                expirationYear: 2029,
                securityCode: '',
                issuer: ''),
            frequency: 1,
            type: 'months',
            amount: 1),
        isInstanceOf<Subscriptions>());
  });

  test('test subscription search', () async {
    final result = await mercado.subscriptions.search();

    print(result.last.toJson());

    expect(result, isInstanceOf<List<Subscriptions>>());
  });

  test('test subscription get', () async {
    final result = await mercado.subscriptions.get(id: '');
    print(result.toJson());
    expect(result, isInstanceOf<Subscriptions>());
  });

  test('test subscription updateCard', () async {
    expect(
        await mercado.subscriptions.updateCard(
            token: await mercado.card.token(
                cardName: '',
                cpf: '',
                cardNumber: '',
                expirationMoth: 11,
                expirationYear: 2025,
                securityCode: '',
                issuer: 'master'),
            id: ''),
        isInstanceOf<Subscriptions>());
  });

  test('test subscription cancel', () async {
    expect(await mercado.subscriptions.cancel(id: ''),
        isInstanceOf<Subscriptions>());
  });

  test('test subscription pause', () async {
    expect(await mercado.subscriptions.pause(id: ''),
        isInstanceOf<Subscriptions>());
  });

  test('test subscription active', () async {
    expect(await mercado.subscriptions.active(id: ''),
        isInstanceOf<Subscriptions>());
  });
}
