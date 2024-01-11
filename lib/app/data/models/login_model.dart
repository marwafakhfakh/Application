// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    Data data;

    LoginModel({
       required this.data,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    int userId;
    String name;
    String email;
    String token;
    List<dynamic> roles;
    List<dynamic> rolesPermissions;
    List<dynamic> permissions;

    Data({
       required this.userId,
       required this.name,
       required this.email,
       required this.token,
       required this.roles,
       required this.rolesPermissions,
       required this.permissions,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        token: json["token"],
        roles: List<dynamic>.from(json["roles"].map((x) => x)),
        rolesPermissions: List<dynamic>.from(json["roles.permissions"].map((x) => x)),
        permissions: List<dynamic>.from(json["permissions"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "token": token,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "roles.permissions": List<dynamic>.from(rolesPermissions.map((x) => x)),
        "permissions": List<dynamic>.from(permissions.map((x) => x)),
    };
}
