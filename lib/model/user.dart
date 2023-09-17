import 'dart:convert';

import 'package:hospital/configs/app_configs.dart';

import 'medecin_info.dart';

class UserModel {
  String? address;
  String? avatar;
  String? birthday;
  String? collectionId;
  String? collectionName;
  String? created;
  bool? emailVisibility;
  UserExpand? expand;
  String? firstname;
  String? gender;
  String? id;
  String? lastname;
  String? medecin_info;
  String? phone;
  String? type;
  String? updated;
  String? username;
  bool? verified;
  UserModel({
    this.address,
    this.avatar,
    this.birthday,
    this.collectionId,
    this.collectionName,
    this.created,
    this.emailVisibility,
    this.expand,
    this.firstname,
    this.gender,
    this.id,
    this.lastname,
    this.medecin_info,
    this.phone,
    this.type,
    this.updated,
    this.username,
    this.verified,
  });

  UserModel copyWith({
    String? address,
    String? avatar,
    String? birthday,
    String? collectionId,
    String? collectionName,
    String? created,
    bool? emailVisibility,
    UserExpand? expand,
    String? firstname,
    String? gender,
    String? id,
    String? lastname,
    String? medecin_info,
    String? phone,
    String? type,
    String? updated,
    String? username,
    bool? verified,
  }) {
    return UserModel(
      address: address ?? this.address,
      avatar: avatar ?? this.avatar,
      birthday: birthday ?? this.birthday,
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      created: created ?? this.created,
      emailVisibility: emailVisibility ?? this.emailVisibility,
      expand: expand ?? this.expand,
      firstname: firstname ?? this.firstname,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      lastname: lastname ?? this.lastname,
      medecin_info: medecin_info ?? this.medecin_info,
      phone: phone ?? this.phone,
      type: type ?? this.type,
      updated: updated ?? this.updated,
      username: username ?? this.username,
      verified: verified ?? this.verified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'avatar': avatar,
      'birthday': birthday,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'emailVisibility': emailVisibility,
      'expand': expand?.toMap(),
      'firstname': firstname,
      'gender': gender,
      'id': id,
      'lastname': lastname,
      'medecin_info': medecin_info,
      'phone': phone,
      'type': type,
      'updated': updated,
      'username': username,
      'verified': verified,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      address: map['address'],
      avatar: map['avatar'],
      birthday: map['birthday'],
      collectionId: map['collectionId'],
      collectionName: map['collectionName'],
      created: map['created'],
      emailVisibility: map['emailVisibility'],
      expand: UserExpand.fromMap(map['expand'] ?? {}),
      firstname: map['firstname'],
      gender: map['gender'],
      id: map['id'],
      lastname: map['lastname'],
      medecin_info: map['medecin_info'],
      phone: map['phone'],
      type: map['type'],
      updated: map['updated'],
      username: map['username'],
      verified: map['verified'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(address: $address, avatar: $avatar, birthday: $birthday, collectionId: $collectionId, collectionName: $collectionName, created: $created, emailVisibility: $emailVisibility, expand: $expand, firstname: $firstname, gender: $gender, id: $id, lastname: $lastname, medecin_info: $medecin_info, phone: $phone, type: $type, updated: $updated, username: $username, verified: $verified)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.avatar == avatar &&
        other.birthday == birthday &&
        other.collectionId == collectionId &&
        other.collectionName == collectionName &&
        other.created == created &&
        other.emailVisibility == emailVisibility &&
        other.expand == expand &&
        other.firstname == firstname &&
        other.gender == gender &&
        other.id == id &&
        other.lastname == lastname &&
        other.medecin_info == medecin_info &&
        other.phone == phone &&
        other.type == type &&
        other.updated == updated &&
        other.username == username &&
        other.verified == verified;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        avatar.hashCode ^
        birthday.hashCode ^
        collectionId.hashCode ^
        collectionName.hashCode ^
        created.hashCode ^
        emailVisibility.hashCode ^
        expand.hashCode ^
        firstname.hashCode ^
        gender.hashCode ^
        id.hashCode ^
        lastname.hashCode ^
        medecin_info.hashCode ^
        phone.hashCode ^
        type.hashCode ^
        updated.hashCode ^
        username.hashCode ^
        verified.hashCode;
  }

  String? avatarFormat() {
    if (avatar != null) {
      if (avatar!.startsWith('http')) {
        return avatar;
      }
      return '${AppConfigs.baseUrl}/api/files/$collectionId/$id/$avatar';
    }
    return null;
  }
}

class UserExpand {
  MedecinInfoModel? medecin_info;
  UserExpand({
    this.medecin_info,
  });

  UserExpand copyWith({
    MedecinInfoModel? medecin_info,
  }) {
    return UserExpand(
      medecin_info: medecin_info ?? this.medecin_info,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medecin_info': medecin_info?.toMap(),
    };
  }

  factory UserExpand.fromMap(Map<String, dynamic> map) {
    return UserExpand(
      medecin_info: MedecinInfoModel.fromMap(map['medecin_info'] ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserExpand.fromJson(String source) =>
      UserExpand.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Expand(medecin_info: $medecin_info)';

  @override
  bool operator ==(covariant UserExpand other) {
    if (identical(this, other)) return true;

    return other.medecin_info == medecin_info;
  }

  @override
  int get hashCode => medecin_info.hashCode;
}
