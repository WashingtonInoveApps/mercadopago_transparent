# Mercado Pago Integration

A payment integration library for paid market, includes:

### Client:
  - create: Creates a new customer
  - delete: Deletes a client with a given id
  - save card: Saves a tokenized card to a particular customer.
  - get: Returns a specific customer

### Card:
  - token: Tokens a card.
  - token with card: Generates token from a saved card.
  - get: Returns a specific card.

### Payment:
  - payment methods: Returns all available payment methods.
  - credit card: Payment by credit card.
  - ticket: Payment by boleto.
  - pix: Payment by Pix.
  - get: Returns a specific payment.

### Subscriptions:
  - create: Create a payment subscription.
  - search: Search for payment subscriptions.
  - update card: Update the payment subscription card.
  - cancel: Cancel a payment subscription.
  - pause: Pause a payment subscription.
  - active: Activates a paused payment subscription.
  - get: Returns a specific payment subscription.


> Starting with module:

```
import 'package:mercadopago_transparent/mercadopago_transparent.dart'
    as mercadopago;

final mercado =
      mercadopago.MercadoPago(acessToken: 'ACESS_TOKEN', publicKey: 'PUBLIC_KEY', applicationId: '');
```
> Tokenizing a card:

 ```
 String token = await mercado.card.token(
        cardName: 'cardName',
        cpf: 'cpf',
        cardNumber: 'cardNumber',
        expirationMoth: 11,
        expirationYear: 2025,
        securityCode: 'securityCode',
        issuer: 'issuer'); 
 ```
 **Issuer** is the ID of the card-issuing bank. For more information: https://www.mercadopago.com.br/developers/pt/guides/resources/localization/payment-methods

 Example: master, visa ...
 
 > Creating a client
 
 ```
 final client =
        mercadopago.Client(firstName: '', email: '', docNumber: '', phone: '');

    String clientId = await mercado.client.create(client: client);
 ```

You can relate the card to the customer for future purchases

 ```
 String cardId =
        await mercado.client.savecard(clientId: 'clientId', token: 'token');
 ```
 Tokenize the saved card requires the security code and the card ID.
 
 ```
 String token =
        await mercado.card.tokenWithCard(cardId: 'cardId', securityCode: 'securityCode');
 ```
 
 ## Payment
 
 > Payment by credit card.
 
If it is passed as a parameter [clientId], it makes the payment with the customer's information already saved in the paid market.
Otherwise, it is mandatory to fill in all other customer information [email], [name], [docNumber].
 
 ```
 mercadopago.Payment pay =
        await mercado.payment.creditCard(tokenCard: 'tokenCard', clientId: '', amount: 100.0);
 ```
 
 > Payment by ticket.
  
 ```
 mercadopago.Payment pay =
        await mercado.payment.ticket(name: 'name', email: 'email', docNumber: 'docNumber', , amount: 100.0);
 ```
 
 One of the parameters of the Payment class is [barCode]. The payment slip barcode.
 
 > Payment by PIX.
  
 ```
 mercadopago.Payment pay =
        await mercado.payment.ticket(name: 'name', email: 'email', docNumber: 'docNumber', amount: 100.0);
 ```
One of the parameters of the Payment class is [qrCode], the pix code for payment. In addition to [qrCodeRender], to redefine the code in the view.

## Subscription

Subscriptions only work with real users, requiring a real card. Or with test users, the latter being both test users.

You will be able to create a subscription, pause and cancel a subscription.
 
> Creating signature

 ```
mercadopago.Subscriptions = await mercado.subscriptions.create(
            description: 'Teste',
            email: '',
            token: 'token card',
            frequency: 1,
            type: 'months',
            amount: 1);
 ```

[type] - Indicates the type of frequency. It can be per month (months) or per day (days).
  
**For example, if every fifteen days it was necessary to generate a parcel to be charged, it would be like this: frequency: 15 o type: days**

The subscription method is without an associated plan. For more information visit: https://www.mercadopago.com.br/developers/pt/guides/online-payments/subscriptions/integration.