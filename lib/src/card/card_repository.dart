import 'package:mercadopago_transparent/src/card/card_model.dart';
import 'package:mercadopago_transparent/src/card/installment_model.dart';
import 'package:mercadopago_transparent/src/request_repository.dart';

class CardRepository {
  final request = Request();
  final String acessToken;

  CardRepository({required this.acessToken});

  ///Retorna as informações de um cartão através de seu [id]
  Future<Card?> get({required String id}) async {
    try {
      var result = await request.get(path: "v1/card_tokens/$id", acessToken: acessToken);

      final card = Card.fromJson(result, options: true);

      print(card.toJson());
      return card;
    } catch (e) {
      return throw e;
    }
  }

  ///Essa função gera o token do cartão.
  ///
  ///Para saber mais detalhes do tipo de pagamento e id, acesse:
  ///https://www.mercadopago.com.br/developers/pt/guides/resources/localization/payment-methods
  Future<String> token(
      {required String cardName,
      required String cpf,
      required String cardNumber,
      required int expirationMoth,
      required int expirationYear,
      required String securityCode,
      required String issuer}) async {
    try {
      final card = {
        'cardholder': {
          'identification': {
            'number': cpf,
            'type': 'CPF',
          },
          'name': cardName,
        },
        'cardNumber': cardNumber,
        'expirationMonth': expirationMoth,
        'expirationYear': expirationYear,
        'securityCode': securityCode,
        'issuer': issuer
      };

      final result =
          await request.post(path: 'v1/card_tokens?public_key=PUBLIC_KEY', acessToken: acessToken, data: card);
      final id = result['id'];

      print(id);
      return id;
    } catch (e) {
      return throw e;
    }
  }

  ///Essa função gera um token de um cartão ja salvo do client através do [cardId] id do cartão salvo
  ///e do [securityCode] código de segurança do cartão.
  Future<String> tokenWithCard({required String cardId, required String securityCode}) async {
    try {
      final result = await request
          .post(path: 'v1/card_tokens', acessToken: acessToken, data: {'cardId': cardId, 'securityCode': securityCode});

      print(result['id']);
      return result['id'];
    } catch (e) {
      return throw e;
    }
  }

  /// Retorna as parcelas possíveis pelo valor informado já
  /// com o valor total com juros
  Future<List<InstallmentModel>> getInstallments({
    required double amount,
    required String cardNumber,
  }) async {
    final result = <InstallmentModel>[];
    try {
      final params = Uri(queryParameters: {
        'locale': 'pt-BR',
        'amount': amount.toString(),
        'bin': cardNumber.replaceAll(' ', '').substring(0, 8),
      }).query;

      final resp = await request.get(path: 'v1/payment_methods/installments?$params', acessToken: acessToken);

      result.addAll(InstallmentModel.listFromJson(resp[0]['payer_costs']));
    } catch (e) {
      return throw e;
    }
    return result;
  }
}
