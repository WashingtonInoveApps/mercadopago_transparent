import 'package:mercadopago_transparent/src/card/card_model.dart';

class Client {
  Client({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.docNumber,
    this.description,
    this.defaultCard,
    this.cards,
  });

  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  String? docNumber;
  String? description;
  String? defaultCard;
  List<Card>? cards;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: (json["phone"]["number"]),
        docNumber: (json["identification"]["number"]),
        description: json["description"],
        defaultCard: json["default_card"],
        cards: List<Card>.from(json["cards"].map((x) => Card.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    if (cards != null) {
      return {
        "id": id ?? "",
        "email": email,
        "first_name": firstName,
        "last_name": lastName ?? "",
        'phone': {'area_code': '55', 'number': phone},
        'identification': {'type': 'CPF', 'number': docNumber},
        "description": description ?? "",
        "default_card": defaultCard ?? "",
        "cards": List<dynamic>.from(cards!.map((x) => x.toJson())),
      };
    } else {
      return {
        "id": id ?? "",
        "email": email,
        "first_name": firstName,
        "last_name": lastName ?? "",
        'phone': {'area_code': '55', 'number': phone},
        'identification': {'type': 'CPF', 'number': docNumber},
        "description": description ?? ""
      };
    }
  }
}
