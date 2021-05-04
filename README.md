# Mercado Pago Integration

A payment integration library for paid market, includes:
Client:
  - create: Creates a new customer
  - delete: Deletes a client with a given id
  - save card: Saves a tokenized card to a particular customer.
  - get: Returns a specific customer

Card:
  - token: Tokens a card.
  - token with card: Generates token from a saved card.
  - get: Returns a specific card.

Payment:
  - payment methods: Returns all available payment methods.
  - credit card: Payment by credit card.
  - ticket: Payment by boleto.
  - pix: Payment by Pix.
  - get: Returns a specific payment.

Subscriptions:
  - create: Create a payment subscription.
  - search: Search for payment subscriptions.
  - update card: Update the payment subscription card.
  - cancel: Cancel a payment subscription.
  - pause: Pause a payment subscription.
  - active: Activates a paused payment subscription.
  - get: Returns a specific payment subscription.
