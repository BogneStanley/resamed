import 'dart:convert';

import 'disponibility.dart';
import 'hospital.dart';
import 'speciality.dart';

class MedecinInfoModel {
  List<String>? additional_documents;
  String? career_start_date;
  String? collectionId;
  String? collectionName;
  String? created;
  List<String>? disponibilities;
  MedecinInfoExpand? expand;
  List<String>? hospitals;
  String? id;
  bool? isValided;
  String? licence_number;
  String? private_practice_license;
  List<String>? specialities;
  String? study_certificate;
  String? type;
  String? updated;
  MedecinInfoModel({
    this.additional_documents,
    this.career_start_date,
    this.collectionId,
    this.collectionName,
    this.created,
    this.disponibilities,
    this.expand,
    this.hospitals,
    this.id,
    this.isValided,
    this.licence_number,
    this.private_practice_license,
    this.specialities,
    this.study_certificate,
    this.type,
    this.updated,
  });

  MedecinInfoModel copyWith({
    List<String>? additional_documents,
    String? career_start_date,
    String? collectionId,
    String? collectionName,
    String? created,
    List<String>? disponibilities,
    MedecinInfoExpand? expand,
    List<String>? hospitals,
    String? id,
    bool? isValided,
    String? licence_number,
    String? private_practice_license,
    List<String>? specialities,
    String? study_certificate,
    String? type,
    String? updated,
  }) {
    return MedecinInfoModel(
      additional_documents: additional_documents ?? this.additional_documents,
      career_start_date: career_start_date ?? this.career_start_date,
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      created: created ?? this.created,
      disponibilities: disponibilities ?? this.disponibilities,
      expand: expand ?? this.expand,
      hospitals: hospitals ?? this.hospitals,
      id: id ?? this.id,
      isValided: isValided ?? this.isValided,
      licence_number: licence_number ?? this.licence_number,
      private_practice_license:
          private_practice_license ?? this.private_practice_license,
      specialities: specialities ?? this.specialities,
      study_certificate: study_certificate ?? this.study_certificate,
      type: type ?? this.type,
      updated: updated ?? this.updated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'additional_documents': additional_documents,
      'career_start_date': career_start_date,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'disponibilities': disponibilities,
      'expand': expand?.toMap(),
      'hospitals': hospitals,
      'id': id,
      'isValided': isValided,
      'licence_number': licence_number,
      'private_practice_license': private_practice_license,
      'specialities': specialities,
      'study_certificate': study_certificate,
      'type': type,
      'updated': updated,
    };
  }

  factory MedecinInfoModel.fromMap(Map<String, dynamic> map) {
    return MedecinInfoModel(
      additional_documents:
          List<String>.from((map['additional_documents'] ?? [])),
      career_start_date: map['career_start_date'],
      collectionId: map['collectionId'],
      collectionName: map['collectionName'],
      created: map['created'],
      disponibilities: List<String>.from((map['disponibilities'] ?? [])),
      expand: MedecinInfoExpand.fromMap(map['expand'] ?? {}),
      hospitals: List<String>.from((map['hospitals'] ?? [])),
      id: map['id'],
      isValided: map['isValided'],
      licence_number: map['licence_number'],
      private_practice_license: map['private_practice_license'],
      specialities: List<String>.from((map['specialities'] ?? [])),
      study_certificate: map['study_certificate'],
      type: map['type'],
      updated: map['updated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MedecinInfoModel.fromJson(String source) =>
      MedecinInfoModel.fromMap(json.decode(source) ?? {});

  @override
  String toString() {
    return 'MedecinInfoModel(additional_documents: $additional_documents, career_start_date: $career_start_date, collectionId: $collectionId, collectionName: $collectionName, created: $created, disponibilities: $disponibilities, expand: $expand, hospitals: $hospitals, id: $id, isValided: $isValided, licence_number: $licence_number, private_practice_license: $private_practice_license, specialities: $specialities, study_certificate: $study_certificate, type: $type, updated: $updated)';
  }

  @override
  bool operator ==(covariant MedecinInfoModel other) {
    if (identical(this, other)) return true;

    return other.career_start_date == career_start_date &&
        other.collectionId == collectionId &&
        other.collectionName == collectionName &&
        other.created == created &&
        other.expand == expand &&
        other.id == id &&
        other.isValided == isValided &&
        other.licence_number == licence_number &&
        other.private_practice_license == private_practice_license &&
        other.study_certificate == study_certificate &&
        other.type == type &&
        other.updated == updated;
  }

  @override
  int get hashCode {
    return additional_documents.hashCode ^
        career_start_date.hashCode ^
        collectionId.hashCode ^
        collectionName.hashCode ^
        created.hashCode ^
        disponibilities.hashCode ^
        expand.hashCode ^
        hospitals.hashCode ^
        id.hashCode ^
        isValided.hashCode ^
        licence_number.hashCode ^
        private_practice_license.hashCode ^
        specialities.hashCode ^
        study_certificate.hashCode ^
        type.hashCode ^
        updated.hashCode;
  }
}

class MedecinInfoExpand {
  List<DisponibilityModel>? disponibilities;
  List<HospitalModel>? hospitals;
  List<SpecialityModel>? specialities;
  MedecinInfoExpand({
    this.disponibilities,
    this.hospitals,
    this.specialities,
  });

  MedecinInfoExpand copyWith({
    List<DisponibilityModel>? disponibilities,
    List<HospitalModel>? hospitals,
    List<SpecialityModel>? specialities,
  }) {
    return MedecinInfoExpand(
      disponibilities: disponibilities ?? this.disponibilities,
      hospitals: hospitals ?? this.hospitals,
      specialities: specialities ?? this.specialities,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'disponibilities': disponibilities?.map((x) => x.toMap()).toList(),
      'hospitals': hospitals?.map((x) => x.toMap()).toList(),
      'specialities': specialities?.map((x) => x.toMap()).toList(),
    };
  }

  factory MedecinInfoExpand.fromMap(Map<String, dynamic> map) {
    return MedecinInfoExpand(
      disponibilities: List<DisponibilityModel>.from(
        (map['disponibilities'] ?? []).map<DisponibilityModel>(
          (x) => DisponibilityModel.fromMap(x ?? {}),
        ),
      ),
      hospitals: List<HospitalModel>.from(
        (map['hospitals'] ?? []).map<HospitalModel>(
          (x) => HospitalModel.fromMap(x ?? {}),
        ),
      ),
      specialities: List<SpecialityModel>.from(
        (map['specialities'] ?? []).map<SpecialityModel>(
          (x) => SpecialityModel.fromMap(x ?? {}),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MedecinInfoExpand.fromJson(String source) =>
      MedecinInfoExpand.fromMap(json.decode(source) ?? {});

  @override
  String toString() =>
      'Expand(disponibilities: $disponibilities, hospitals: $hospitals, specialities: $specialities)';

  @override
  int get hashCode =>
      disponibilities.hashCode ^ hospitals.hashCode ^ specialities.hashCode;
}
