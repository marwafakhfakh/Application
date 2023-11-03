class RegisterModel {
  Data? data;

  RegisterModel({this.data, required String name, required String password, required String email});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class Data {
  int? userId;
  String? name;
  String? email;
  String? token;
  List<String>? roles;
  List<String>? rolesPermissions;
  List<String>? permissions;

  Data(
      {this.userId,
      this.name,
      this.email,
      this.token,
      this.roles,
      this.rolesPermissions,
      this.permissions});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    roles = json['roles'].cast<String>();
    rolesPermissions = json['roles.permissions'].cast<String>();
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['token'] = this.token;
    data['roles'] = this.roles;
    data['roles.permissions'] = this.rolesPermissions;

    return data;
  }
}