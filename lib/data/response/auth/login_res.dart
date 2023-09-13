import 'dart:convert';

class LoginResponse {
  LoginData? data;
  LoginResponse({
    this.data,
  });

  LoginResponse copyWith({
    LoginData? data,
  }) {
    return LoginResponse(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data?.toMap(),
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      data: LoginData.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginResponse(data: $data)';

  @override
  bool operator ==(covariant LoginResponse other) {
    if (identical(this, other)) return true;

    return other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class LoginData {
  String? access_token;
  int? expires;
  String? refresh_token;
  LoginData({
    this.access_token,
    this.expires,
    this.refresh_token,
  });

  LoginData copyWith({
    String? access_token,
    int? expires,
    String? refresh_token,
  }) {
    return LoginData(
      access_token: access_token ?? this.access_token,
      expires: expires ?? this.expires,
      refresh_token: refresh_token ?? this.refresh_token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': access_token,
      'expires': expires,
      'refresh_token': refresh_token,
    };
  }

  factory LoginData.fromMap(Map<String, dynamic> map) {
    return LoginData(
      access_token: map['access_token'],
      expires: map['expires'],
      refresh_token: map['refresh_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginData.fromJson(String source) =>
      LoginData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Data(access_token: $access_token, expires: $expires, refresh_token: $refresh_token)';

  @override
  bool operator ==(covariant LoginData other) {
    if (identical(this, other)) return true;

    return other.access_token == access_token &&
        other.expires == expires &&
        other.refresh_token == refresh_token;
  }

  @override
  int get hashCode =>
      access_token.hashCode ^ expires.hashCode ^ refresh_token.hashCode;
}
