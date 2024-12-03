import 'package:arunmall/env/appexports.dart';

class UsersModel {
  String? sId;
  TextEditingController? fullname;
  String? role;
  String? type;
  String? image;
  String? gender;
  TextEditingController? email;
  TextEditingController? password;

  UsersModel({
    this.sId,
    this.fullname,
    this.role,
    this.type,
    this.gender,
    this.image,
    this.email,
    this.password,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = TextEditingController.fromValue(
        TextEditingValue(text: json['fullname'] ?? ""));
    role = json['role'];
    type = json['type'];
    image = json['image'];
    gender = json['gender'];
    email = TextEditingController.fromValue(
        TextEditingValue(text: json['email'] ?? ""));
    password = TextEditingController.fromValue(
        TextEditingValue(text: json['password'] ?? ""));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['fullname'] = fullname;
    data['role'] = role;
    data['type'] = type;
    data['image'] = image;
    data['gender'] = gender;
    data['email'] = email;
    data['password'] = password;

    return data;
  }
}
