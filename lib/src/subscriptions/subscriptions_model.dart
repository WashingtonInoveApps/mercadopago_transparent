class Subscriptions {
  Subscriptions(
      {this.id,
      this.payerId,
      this.payerEmail,
      this.backUrl,
      this.collectorId,
      this.applicationId,
      this.status,
      this.reason,
      this.externalReference,
      this.dateCreated,
      this.lastModified,
      this.details,
      this.paymentMethodId,
      this.cardId,
      this.nextPaymentDate,
      this.payerFirstName,
      this.paymentMethod});

  String? id;
  int? payerId;
  String? payerEmail;
  String? backUrl;
  int? collectorId;
  int? applicationId;
  String? status;
  String? reason;
  String? externalReference;
  DateTime? dateCreated;
  DateTime? lastModified;
  Details? details;
  String? paymentMethodId;
  String? cardId;
  String? nextPaymentDate;
  String? payerFirstName;
  String? paymentMethod;

  factory Subscriptions.fromJson(Map<String, dynamic> json,
          {bool options = false}) =>
      Subscriptions(
          id: json["id"],
          payerId: json["payer_id"],
          payerEmail: json["payer_email"],
          backUrl: json["back_url"],
          collectorId: json["collector_id"],
          applicationId: json["application_id"],
          status: json["status"],
          reason: json["reason"],
          externalReference: json["external_reference"],
          dateCreated: DateTime.parse(json["date_created"]),
          lastModified: DateTime.parse(json["last_modified"]),
          details: Details.fromJson(json["auto_recurring"]),
          paymentMethodId: json["payment_method_id"],
          cardId: json["card_id"],
          nextPaymentDate: options ? json["next_payment_date"] : "",
          payerFirstName: options ? json["payer_first_name"] : "",
          paymentMethod: options ? json["payment_method_id"] : "");

  Map<String, dynamic> toJson() => {
        "id": id,
        "payer_id": payerId,
        "payer_email": payerEmail,
        "back_url": backUrl,
        "collector_id": collectorId,
        "application_id": applicationId,
        "status": status,
        "reason": reason,
        "external_reference": externalReference,
        "date_created": dateCreated!.toIso8601String(),
        "last_modified": lastModified!.toIso8601String(),
        "details": details!.toJson(),
        "payment_method_id": paymentMethodId,
        "card_id": cardId,
        "nextPaymentDate": nextPaymentDate,
        "payerFirstName": payerFirstName,
        "paymentMethod": paymentMethod
      };
}

class Details {
  Details({
    this.frequency,
    this.frequencyType,
    this.transactionAmount,
    this.currencyId,
    this.endDate,
  });

  int? frequency;
  String? frequencyType;
  double? transactionAmount;
  String? currencyId;
  DateTime? endDate;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        frequency: json["frequency"],
        frequencyType: json["frequency_type"],
        transactionAmount: json["transaction_amount"].toDouble(),
        currencyId: json["currency_id"],
        endDate:
            json["end_date"] != null ? DateTime.parse(json["end_date"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "frequency": frequency,
        "frequency_type": frequencyType,
        "transaction_amount": transactionAmount,
        "currency_id": currencyId,
        "end_date": endDate != null ? endDate!.toIso8601String() : "",
      };
}
