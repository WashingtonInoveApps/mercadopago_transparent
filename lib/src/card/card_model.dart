class Card {
  Card({
    this.id,
    this.expirationMonth,
    this.expirationYear,
    this.firstSixDigits,
    this.lastFourDigits,
    this.paymentMethod,
    this.paymentType,
    this.issuer,
    this.docNumber,
    this.customerId,
    this.securityCode,
    this.cardName,
    this.userId,
  });

  String? id;
  int? expirationMonth;
  int? expirationYear;
  String? firstSixDigits;
  String? lastFourDigits;
  String? paymentMethod;
  String? paymentType;
  String? docNumber;
  int? issuer;
  String? securityCode;
  String? customerId;
  String? userId;
  String? cardName;

  factory Card.fromJson(Map<String, dynamic> json, {bool options = false}) =>
      Card(
        id: json["id"] ?? "",
        expirationMonth: json["expiration_month"] ?? 0,
        expirationYear: json["expiration_year"] ?? 0,
        firstSixDigits: json["first_six_digits"] ?? "",
        lastFourDigits: json["last_four_digits"] ?? "",
        paymentMethod: options ? "" : (json["payment_method"]["name"] ?? ""),
        paymentType:
            options ? "" : (json["payment_method"]["payment_type_id"] ?? ""),
        issuer: options ? 0 : (json["issuer"]["id"] ?? 0),
        cardName: json["cardholder"]["name"] ?? "",
        docNumber: json["cardholder"]["identification"]["number"] ?? "",
        customerId: json["customer_id"] ?? "",
        userId: options ? "" : (json["user_id"] ?? ""),
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
          'name': cardName,
        },
        "customer_id": customerId,
        "user_id": userId,
      };
}
