// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hospital/main.dart';

class MedecinModel {
  String id;
  String firstname;
  String lastname;
  String? type;
  String? avatar;
  MedecinModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    this.type,
    this.avatar,
  });

  MedecinModel copyWith({
    String? id,
    String? firstname,
    String? lastname,
    String? type,
    String? avatar,
  }) {
    return MedecinModel(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      type: type ?? this.type,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'type': type,
      'avatar': avatar,
    };
  }

  factory MedecinModel.fromMap(Map<String, dynamic> map) {
    logger.d(map);
    return MedecinModel(
      id: map['id'] as String,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      type: map['expand']['medecin_info']["type"],
      avatar: map["avatar"]?.toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MedecinModel.fromJson(String source) =>
      MedecinModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MedecinConsultation(id: $id, firstname: $firstname, lastname: $lastname, type: $type, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant MedecinModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.type == type;
  }

  String get typeFormatted {
    switch (type) {
      case "generalist":
        return "Généraliste";
      case "specialist":
        return "Spécialiste";
      default:
        return "";
    }
  }

  @override
  int get hashCode {
    return id.hashCode ^ firstname.hashCode ^ lastname.hashCode ^ type.hashCode;
  }
}
