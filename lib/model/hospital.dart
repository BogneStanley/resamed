import 'dart:convert';

class HospitalModel {
  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? name;
  String? updated;
  HospitalModel({
    this.collectionId,
    this.collectionName,
    this.created,
    this.id,
    this.name,
    this.updated,
  });

  HospitalModel copyWith({
    String? collectionId,
    String? collectionName,
    String? created,
    String? id,
    String? name,
    String? updated,
  }) {
    return HospitalModel(
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      created: created ?? this.created,
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
      'id': id,
      'name': name,
      'updated': updated,
    };
  }

  factory HospitalModel.fromMap(Map<String, dynamic> map) {
    return HospitalModel(
      collectionId: map['collectionId'],
      collectionName: map['collectionName'],
      created: map['created'],
      id: map['id'],
      name: map['name'],
      updated: map['updated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HospitalModel.fromJson(String source) =>
      HospitalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HospitalModel(collectionId: $collectionId, collectionName: $collectionName, created: $created, id: $id, name: $name, updated: $updated)';
  }

  @override
  bool operator ==(covariant HospitalModel other) {
    if (identical(this, other)) return true;

    return other.collectionId == collectionId &&
        other.collectionName == collectionName &&
        other.created == created &&
        other.id == id &&
        other.name == name &&
        other.updated == updated;
  }

  @override
  int get hashCode {
    return collectionId.hashCode ^
        collectionName.hashCode ^
        created.hashCode ^
        id.hashCode ^
        name.hashCode ^
        updated.hashCode;
  }
}
