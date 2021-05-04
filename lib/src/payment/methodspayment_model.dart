
class MethodsPayment {
  MethodsPayment({
    this.id,
    this.name,
    this.paymentTypeId,
    this.status,
    this.image,
    this.cardNumberLength,
    this.installmentsPattern,
    this.securityCodeLength,
    this.exclusionPattern,
    this.maxAllowedAmount,
    this.accreditationTime,
  });

  String? id;
  String? name;
  String? paymentTypeId;
  String? status;
  String? image;

  int? cardNumberLength;
  String? installmentsPattern;
  String? exclusionPattern;
  int? securityCodeLength;
  int? maxAllowedAmount;
  int? accreditationTime;

  factory MethodsPayment.fromJson(Map<String, dynamic> json) => MethodsPayment(
        id: json["id"],
        name: json["name"],
        paymentTypeId: json["payment_type_id"],
        status: json["status"],
        image: json["thumbnail"],
        maxAllowedAmount: json["max_allowed_amount"],
        accreditationTime: json["accreditation_time"],
        cardNumberLength: json["settings"].length > 0
            ? json["settings"][0]["card_number"]["length"]
            : 0,
        installmentsPattern: json["settings"].length > 0
            ? json["settings"][0]["bin"]["installments_pattern"]
            : "",
        exclusionPattern: json["settings"].length > 0
            ? json["settings"][0]["bin"]["exclusion_pattern"]
            : "",
        securityCodeLength: json["settings"].length > 0
            ? json["settings"][0]["security_code"]["length"]
            : 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "payment_type_id": paymentTypeId,
        "status": status,
        "thumbnail": image,
        "max_allowed_amount": maxAllowedAmount,
        "accreditation_time": accreditationTime,
        "cardNumberLength": cardNumberLength,
        "installmentsPattern": installmentsPattern,
        "exclusionPattern": exclusionPattern,
        "securityCodeLength": securityCodeLength
      };
}

