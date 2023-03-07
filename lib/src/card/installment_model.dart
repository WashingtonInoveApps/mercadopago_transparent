class InstallmentModel {
  int? installments;
  int? installmentRate;
  int? discountRate;
  List<String?>? installmentRateCollector;
  double? minAllowedAmount;
  double? maxAllowedAmount;
  String? recommendedMessage;
  double? installmentAmount;
  double? totalAmount;
  String? paymentMethodOptionId;

  InstallmentModel({
    this.installments,
    this.installmentRate,
    this.discountRate,
    this.installmentRateCollector = const [],
    this.minAllowedAmount,
    this.maxAllowedAmount,
    this.recommendedMessage,
    this.installmentAmount,
    this.totalAmount,
    this.paymentMethodOptionId,
  });

  InstallmentModel.fromJson(Map<String, dynamic> json) {
    installments = json['installments']?.toInt();
    installmentRate = json['installment_rate']?.toInt();
    discountRate = json['discount_rate']?.toInt();
    if (json['installment_rate_collector'] != null) {
      installmentRateCollector = <String>[];
      for (var item in json['installment_rate_collector']) {
        installmentRateCollector!.add(item.toString());
      }
    }
    minAllowedAmount = json['min_allowed_amount']?.toDouble();
    maxAllowedAmount = json['max_allowed_amount']?.toDouble();
    recommendedMessage = json['recommended_message']?.toString();
    installmentAmount = json['installment_amount']?.toDouble();
    totalAmount = json['total_amount']?.toDouble();
    paymentMethodOptionId = json['payment_method_option_id']?.toString();
  }

  static List<InstallmentModel> listFromJson(List jsonList) {
    final result = <InstallmentModel>[];
    for (var item in jsonList) {
      result.add(InstallmentModel.fromJson(item));
    }
    return result;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['installments'] = installments;
    data['installment_rate'] = installmentRate;
    data['discount_rate'] = discountRate;
    data['installment_rate_collector'] = installmentRateCollector.toString();
    data['min_allowed_amount'] = minAllowedAmount;
    data['max_allowed_amount'] = maxAllowedAmount;
    data['recommended_message'] = recommendedMessage;
    data['installment_amount'] = installmentAmount;
    data['total_amount'] = totalAmount;
    data['payment_method_option_id'] = paymentMethodOptionId;
    return data;
  }
}
