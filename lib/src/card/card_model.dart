class Card {
  Card({
    required this.id,
    required this.expirationMonth,
    required this.expirationYear,
    required this.firstSixDigits,
    required this.lastFourDigits,
    required this.paymentMethod,
    required this.paymentMethodId,
    required this.paymentType,
    required this.issuer,
    required this.docNumber,
    required this.customerId,
    required this.securityCode,
    required this.cardholderName,
    required this.userId,
  });

  String id;
  int expirationMonth;
  int expirationYear;
  String? firstSixDigits;
  String lastFourDigits;
  String? issuer;
  String? paymentMethod;
  String? paymentType;
  String? paymentMethodId;
  String? docNumber;
  String? userId;
  String? securityCode;
  String customerId;
  String cardholderName;

  factory Card.fromJson(Map<String, dynamic> json, {bool options = false}) =>
      Card(
        id: json["id"],
        expirationMonth: json["expiration_month"],
        expirationYear: json["expiration_year"],
        firstSixDigits: json["first_six_digits"],
        lastFourDigits: json["last_four_digits"],
        paymentMethodId: options ? null : json["payment_method"]["id"],
        paymentMethod: options ? null : json["payment_method"]["name"],
        paymentType: options ? null : json["payment_method"]["payment_type_id"],
        issuer: options ? null : json["issuer"]["name"],
        cardholderName: json["cardholder"]["name"],
        docNumber: json["cardholder"]["identification"]["number"],
        customerId: json["customer_id"],
        userId: options ? null : json["user_id"],
        securityCode: null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "expiration_month": expirationMonth,
        "expiration_year": expirationYear,
        "first_six_digits": firstSixDigits,
        "last_four_digits": lastFourDigits,
        "security_code": securityCode,
        "issuer": issuer,
        'cardholder': {
          'identification': {
            'number': docNumber,
            'type': 'CPF',
          },
          'name': cardholderName,
        },
        "customer_id": customerId,
        "user_id": userId,
      };
}
