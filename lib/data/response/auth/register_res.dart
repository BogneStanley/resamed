import 'dart:convert';

class RegisterResponse {
  RegisterData? data;
  RegisterResponse({
    this.data,
  });

  RegisterResponse copyWith({
    RegisterData? data,
  }) {
    return RegisterResponse(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data?.toMap(),
    };
  }

  factory RegisterResponse.fromMap(Map<String, dynamic> map) {
    return RegisterResponse(
      data: RegisterData.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponse.fromJson(String source) =>
      RegisterResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegisterResponse(data: $data)';

  @override
  bool operator ==(covariant RegisterResponse other) {
    if (identical(this, other)) return true;

    return other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class RegisterData {
  String? id;
  String? role;
  RegisterData({
    this.id,
    this.role,
  });

  RegisterData copyWith({
    String? id,
    String? role,
  }) {
    return RegisterData(
      id: id ?? this.id,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'role': role,
    };
  }

  factory RegisterData.fromMap(Map<String, dynamic> map) {
    return RegisterData(
      id: map['id'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterData.fromJson(String source) =>
      RegisterData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegisterData(id: $id, role: $role)';

  @override
  bool operator ==(covariant RegisterData other) {
    if (identical(this, other)) return true;

    return other.id == id && other.role == role;
  }

  @override
  int get hashCode => id.hashCode ^ role.hashCode;
}
