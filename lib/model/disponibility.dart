import 'dart:convert';

class DisponibilityModel {
  String? collectionId;
  String? collectionName;
  String? created;
  String? day;
  String? hour;
  String? id;
  bool? isActif;
  String? medecin;
  String? updated;
  DisponibilityModel({
    this.collectionId,
    this.collectionName,
    this.created,
    this.day,
    this.hour,
    this.id,
    this.isActif,
    this.medecin,
    this.updated,
  });

  DisponibilityModel copyWith({
    String? collectionId,
    String? collectionName,
    String? created,
    String? day,
    String? hour,
    String? id,
    bool? isActif,
    String? medecin,
    String? updated,
  }) {
    return DisponibilityModel(
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      created: created ?? this.created,
      day: day ?? this.day,
      hour: hour ?? this.hour,
      id: id ?? this.id,
      isActif: isActif ?? this.isActif,
      medecin: medecin ?? this.medecin,
      updated: updated ?? this.updated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'day': day,
      'hour': hour,
      'id': id,
      'isActif': isActif,
      'medecin': medecin,
      'updated': updated,
    };
  }

  factory DisponibilityModel.fromMap(Map<String, dynamic> map) {
    return DisponibilityModel(
      collectionId: map['collectionId'],
      collectionName: map['collectionName'],
      created: map['created'],
      day: map['day'],
      hour: map['hour'],
      id: map['id'],
      isActif: map['isActif'],
      medecin: map['medecin'],
      updated: map['updated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DisponibilityModel.fromJson(String source) =>
      DisponibilityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DisponibilityModel(collectionId: $collectionId, collectionName: $collectionName, created: $created, day: $day, hour: $hour, id: $id, isActif: $isActif, medecin: $medecin, updated: $updated)';
  }

  @override
  bool operator ==(covariant DisponibilityModel other) {
    if (identical(this, other)) return true;

    return other.collectionId == collectionId &&
        other.collectionName == collectionName &&
        other.created == created &&
        other.day == day &&
        other.hour == hour &&
        other.id == id &&
        other.isActif == isActif &&
        other.medecin == medecin &&
        other.updated == updated;
  }

  @override
  int get hashCode {
    return collectionId.hashCode ^
        collectionName.hashCode ^
        created.hashCode ^
        day.hashCode ^
        hour.hashCode ^
        id.hashCode ^
        isActif.hashCode ^
        medecin.hashCode ^
        updated.hashCode;
  }
}
