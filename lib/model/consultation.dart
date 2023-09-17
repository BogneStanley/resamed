import 'dart:convert';

import 'package:hospital/model/consultation_type.dart';
import 'package:hospital/model/user.dart';

class ConsultationListModel {
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;
  List<ConsultationModel>? consultations;
  ConsultationListModel({
    this.page,
    this.perPage,
    this.totalItems,
    this.totalPages,
    this.consultations,
  });

  ConsultationListModel copyWith({
    int? page,
    int? perPage,
    int? totalItems,
    int? totalPages,
    List<ConsultationModel>? consultations,
  }) {
    return ConsultationListModel(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      totalItems: totalItems ?? this.totalItems,
      totalPages: totalPages ?? this.totalPages,
      consultations: consultations ?? this.consultations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'perPage': perPage,
      'totalItems': totalItems,
      'totalPages': totalPages,
      'items': consultations?.map((x) => x.toMap()).toList(),
    };
  }

  factory ConsultationListModel.fromMap(Map<String, dynamic> map) {
    return ConsultationListModel(
      page: map['page'].toInt(),
      perPage: map['perPage'].toInt(),
      totalItems: map['totalItems'].toInt(),
      totalPages: map['totalPages'].toInt(),
      consultations: List<ConsultationModel>.from(
        (map['items'] ?? []).map<ConsultationModel>(
          (x) => ConsultationModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConsultationListModel.fromJson(String source) =>
      ConsultationListModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ConsultationModel(page: $page, perPage: $perPage, totalItems: $totalItems, totalPages: $totalPages, items: $consultations)';
  }

  @override
  bool operator ==(covariant ConsultationListModel other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        other.perPage == perPage &&
        other.totalItems == totalItems &&
        other.totalPages == totalPages;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        perPage.hashCode ^
        totalItems.hashCode ^
        totalPages.hashCode ^
        consultations.hashCode;
  }
}

class ConsultationModel {
  String? collectionId;
  String? collectionName;
  String? consultation_date;
  String? created;
  ExpandConsultation? expand;
  String? id;
  String? medecin;
  String? patient;
  String? phone;
  String? reason;
  bool? isAccepted;
  String? resident_location;
  String? type;
  String? updated;
  ConsultationModel({
    this.collectionId,
    this.collectionName,
    this.consultation_date,
    this.isAccepted,
    this.created,
    this.expand,
    this.id,
    this.medecin,
    this.patient,
    this.phone,
    this.reason,
    this.resident_location,
    this.type,
    this.updated,
  });

  ConsultationModel copyWith({
    String? collectionId,
    String? collectionName,
    String? consultation_date,
    String? created,
    ExpandConsultation? expand,
    bool? isAccepted,
    String? id,
    String? medecin,
    String? patient,
    String? phone,
    String? reason,
    String? resident_location,
    String? type,
    String? updated,
  }) {
    return ConsultationModel(
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      consultation_date: consultation_date ?? this.consultation_date,
      created: created ?? this.created,
      expand: expand ?? this.expand,
      id: id ?? this.id,
      isAccepted: isAccepted ?? this.isAccepted,
      medecin: medecin ?? this.medecin,
      patient: patient ?? this.patient,
      phone: phone ?? this.phone,
      reason: reason ?? this.reason,
      resident_location: resident_location ?? this.resident_location,
      type: type ?? this.type,
      updated: updated ?? this.updated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'collectionId': collectionId,
      'collectionName': collectionName,
      'consultation_date': consultation_date,
      'created': created,
      'expand': expand?.toMap(),
      'isAccepted': isAccepted,
      'id': id,
      'medecin': medecin,
      'patient': patient,
      'phone': phone,
      'reason': reason,
      'resident_location': resident_location,
      'type': type,
      'updated': updated,
    };
  }

  factory ConsultationModel.fromMap(Map<String, dynamic> map) {
    return ConsultationModel(
      collectionId: map['collectionId'],
      collectionName: map['collectionName'],
      consultation_date: map['consultation_date'],
      created: map['created'],
      isAccepted: map['isAccepted'],
      expand: ExpandConsultation.fromMap(map['expand'] as Map<String, dynamic>),
      id: map['id'],
      medecin: map['medecin'],
      patient: map['patient'],
      phone: map['phone'],
      reason: map['reason'],
      resident_location: map['resident_location'],
      type: map['type'],
      updated: map['updated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ConsultationModel.fromJson(String source) =>
      ConsultationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(collectionId: $collectionId, collectionName: $collectionName, consultation_date: $consultation_date, created: $created, expand: $expand, id: $id, medecin: $medecin, patient: $patient, phone: $phone, reason: $reason, resident_location: $resident_location, type: $type, updated: $updated)';
  }

  @override
  bool operator ==(covariant ConsultationModel other) {
    if (identical(this, other)) return true;

    return other.collectionId == collectionId &&
        other.collectionName == collectionName &&
        other.consultation_date == consultation_date &&
        other.created == created &&
        other.expand == expand &&
        other.id == id &&
        other.medecin == medecin &&
        other.patient == patient &&
        other.phone == phone &&
        other.reason == reason &&
        other.resident_location == resident_location &&
        other.type == type &&
        other.updated == updated;
  }

  @override
  int get hashCode {
    return collectionId.hashCode ^
        collectionName.hashCode ^
        consultation_date.hashCode ^
        created.hashCode ^
        expand.hashCode ^
        id.hashCode ^
        medecin.hashCode ^
        patient.hashCode ^
        phone.hashCode ^
        reason.hashCode ^
        resident_location.hashCode ^
        type.hashCode ^
        updated.hashCode;
  }
}

class ExpandConsultation {
  UserModel? medecin;
  UserModel? patient;
  ConsultationTypeModel? type;
  ExpandConsultation({
    this.medecin,
    this.patient,
    this.type,
  });

  ExpandConsultation copyWith({
    UserModel? medecin,
    UserModel? patient,
    ConsultationTypeModel? type,
  }) {
    return ExpandConsultation(
      medecin: medecin ?? this.medecin,
      patient: patient ?? this.patient,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medecin': medecin?.toMap(),
      'patient': patient?.toMap(),
      'type': type?.toMap(),
    };
  }

  factory ExpandConsultation.fromMap(Map<String, dynamic> map) {
    return ExpandConsultation(
      medecin: UserModel.fromMap(map['medecin'] as Map<String, dynamic>),
      patient: UserModel.fromMap(map['patient'] as Map<String, dynamic>),
      type: ConsultationTypeModel.fromMap(map['type'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpandConsultation.fromJson(String source) =>
      ExpandConsultation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Expand(medecin: $medecin, patient: $patient, type: $type)';

  @override
  bool operator ==(covariant ExpandConsultation other) {
    if (identical(this, other)) return true;

    return other.medecin == medecin &&
        other.patient == patient &&
        other.type == type;
  }

  @override
  int get hashCode => medecin.hashCode ^ patient.hashCode ^ type.hashCode;
}
