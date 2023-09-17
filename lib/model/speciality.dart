import 'dart:convert';

class SpecialityModel {
  String? collectionId;
  String? collectionName;
  String? created;
  String? description;
  String? id;
  String? name;
  String? updated;
  SpecialityModel({
    this.collectionId,
    this.collectionName,
    this.created,
    this.description,
    this.id,
    this.name,
    this.updated,
  });

  SpecialityModel copyWith({
    String? collectionId,
    String? collectionName,
    String? created,
    String? description,
    String? id,
    String? name,
    String? updated,
  }) {
    return SpecialityModel(
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      created: created ?? this.created,
      description: description ?? this.description,
      id: id ?? this.id,
      name: name ?? this.name,
      updated: updated ?? this.updated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'description': description,
      'id': id,
      'name': name,
      'updated': updated,
    };
  }

  factory SpecialityModel.fromMap(Map<String, dynamic> map) {
    return SpecialityModel(
      collectionId: map['collectionId'],
      collectionName: map['collectionName'],
      created: map['created'],
      description: map['description'],
      id: map['id'],
      name: map['name'],
      updated: map['updated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialityModel.fromJson(String source) =>
      SpecialityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SpecialityModel(collectionId: $collectionId, collectionName: $collectionName, created: $created, description: $description, id: $id, name: $name, updated: $updated)';
  }

  @override
  bool operator ==(covariant SpecialityModel other) {
    if (identical(this, other)) return true;

    return other.collectionId == collectionId &&
        other.collectionName == collectionName &&
        other.created == created &&
        other.description == description &&
        other.id == id &&
        other.name == name &&
        other.updated == updated;
  }

  @override
  int get hashCode {
    return collectionId.hashCode ^
        collectionName.hashCode ^
        created.hashCode ^
        description.hashCode ^
        id.hashCode ^
        name.hashCode ^
        updated.hashCode;
  }
}
