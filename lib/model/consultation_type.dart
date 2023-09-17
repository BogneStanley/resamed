// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ConsultationTypeModel {
  String id;
  String label;
  ConsultationTypeModel({
    required this.id,
    required this.label,
  });

  ConsultationTypeModel copyWith({
    String? id,
    String? label,
  }) {
    return ConsultationTypeModel(
      id: id ?? this.id,
      label: label ?? this.label,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
    };
  }

  factory ConsultationTypeModel.fromMap(Map<String, dynamic> map) {
    return ConsultationTypeModel(
      id: map['id'] as String,
      label: map['label'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConsultationTypeModel.fromJson(String source) =>
      ConsultationTypeModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ConsultationTypeModel(id: $id, label: $label)';

  @override
  bool operator ==(covariant ConsultationTypeModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.label == label;
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode;
}
