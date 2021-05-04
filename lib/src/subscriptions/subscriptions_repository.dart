import 'package:mercadopago_transparent/src/request_repository.dart';
import 'package:mercadopago_transparent/src/subscriptions/subscriptions_model.dart';

class SubscriptionsRepository {
  final String acessToken;
  final request = Request();

  SubscriptionsRepository({required this.acessToken});

  ///Cria um plano para assinatura.
  ///
  ///[description] - Esta é a descrição que o assinante verá quando assinar e o detalhe que será visto na fatura do cartão.
  ///
  ///[frenquency] - Indica o tempo ou ciclo com base no tipo de assinatura.
  ///
  ///[type] - Indica o tipo de frequência. Pode ser por mês (months) ou por dia (days).
  ///Por exemplo, se a cada quinze dias fosse necessário gerar uma parcela para ser cobrada, seria assim: frequency: 15 o type: days
  ///
  ///[externalReference] - Pode ser qualquer indentificador relacionado ao seu pedido de assinatura (id pedido, id produto e etc.)
  ///
  ///[token] - Token gerado pela tokenização do cartão.
  ///
  ///Mais informações: https://www.mercadopago.com.br/developers/pt/guides/online-payments/subscriptions/integration
  Future<Subscriptions> create(
      {String? externalReference,
      required String description,
      required int frequency,
      required String token,
      required String type,
      required dynamic email,
      int? periodFree,
      int? repetition,
      required double amount}) async {
    try {
      final data = {
        "reason": description,
        "auto_recurring": {
          "frequency": 1,
          "frequency_type": type,
          "transaction_amount": amount,
          "currency_id": "BRL",
          "repetitions": repetition
        },
        "back_url": "https://www.mercadopago.com.br/",
        "external_reference": externalReference ?? "",
        "card_token_id": token,
        "payer_email": email,
        "status": "authorized",
        "free_trial": {"frequency_type": type, "frequency": periodFree ?? 0}
      };

      final result = await request.post(
          path: 'preapproval', acessToken: acessToken, data: data);

      final subscription = Subscriptions.fromJson(result);
      return subscription;
    } catch (e) {
      return throw e;
    }
  }

  Future<List<Subscriptions>> search({String? email}) async {
    try {
      final path = email != null
          ? 'preapproval/search?email=$email'
          : 'preapproval/search';
      final result = await request.get(path: path, acessToken: acessToken);
      final search = List<Subscriptions>.from(result["results"]
          .map((sub) => Subscriptions.fromJson(sub, options: true))
          .toList());

      return search;
    } catch (e) {
      return throw e;
    }
  }

  ///Essa função busca informações de uma inscrição específica.
  Future<Subscriptions> get({required String id}) async {
    try {
      final result =
          await request.get(path: 'preapproval/$id', acessToken: acessToken);
      final subs = Subscriptions.fromJson(result);
      return subs;
    } catch (e) {
      return throw e;
    }
  }

  ///Essa função atualiza as informações do cartão através de um novo [token].
  Future<Subscriptions> updateCard(
      {required String token, required String id}) async {
    try {
      final result = await request.put(
          path: 'preapproval/$id',
          acessToken: acessToken,
          data: {"card_token_id": token});

      final subs = Subscriptions.fromJson(result);
      return subs;
    } catch (e) {
      return throw e;
    }
  }

  ///Essa função cancela uma inscrição alterando o valor de [status]
  Future<Subscriptions> cancel({required String id}) async {
    try {
      final result = await request.put(
          path: 'preapproval/$id',
          acessToken: acessToken,
          data: {"status": "cancelled"});

      final subs = Subscriptions.fromJson(result);
      return subs;
    } catch (e) {
      return throw e;
    }
  }

  ///Essa função pausa uma determinada inscrição.
  Future<Subscriptions> pause({required String id}) async {
    try {
      final result = await request.put(
          path: 'preapproval/$id',
          acessToken: acessToken,
          data: {"status": "paused"});

      final subs = Subscriptions.fromJson(result);
      return subs;
    } catch (e) {
      return throw e;
    }
  }

  ///Essa função ativa as inscrições pausadas. Não é possivel ativar inscrições com [status] cancelados.
  Future<Subscriptions> active({required String id}) async {
    try {
      final result = await request.put(
          path: 'preapproval/$id',
          acessToken: acessToken,
          data: {"status": "authorized"});

      final subs = Subscriptions.fromJson(result);
      return subs;
    } catch (e) {
      return throw e;
    }
  }
}
