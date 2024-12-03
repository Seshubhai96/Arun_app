import 'package:arunmall/env/appexports.dart';

class UsersModel {
  String? sId;
  TextEditingController? fullname;
  String? role;
  String? type;
  Imageurl? imageurl;
  String? gender;
  TextEditingController? email;
  TextEditingController? password;

  UsersModel({
    this.sId,
    this.fullname,
    this.role,
    this.type,
    this.imageurl,
    this.gender,
    this.email,
    this.password,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullname = TextEditingController.fromValue(
        TextEditingValue(text: json['fullname'] ?? ""));
    role = json['role'];
    type = json['type'];
    imageurl = json['imageurl'] != null
        ? new Imageurl.fromJson(json['imageurl'])
        : null;
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
    if (imageurl != null) {
      data['imageurl'] = imageurl!.toJson();
    }
    data['gender'] = gender;
    data['email'] = email;
    data['password'] = password;

    return data;
  }
}

class Imageurl {
  String? imagepath;
  Imagebuffer? imagebuffer;
  String? sId;

  Imageurl({this.imagepath, this.imagebuffer, this.sId});

  Imageurl.fromJson(Map<String, dynamic> json) {
    imagepath = json['imagepath'];
    imagebuffer = json['imagebuffer'] != null
        ? new Imagebuffer.fromJson(json['imagebuffer'])
        : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imagepath'] = imagepath;
    if (imagebuffer != null) {
      data['imagebuffer'] = imagebuffer!.toJson();
    }
    data['_id'] = sId;
    return data;
  }
}

class Imagebuffer {
  String? type;
  List<int>? data;

  Imagebuffer({this.type, this.data});

  Imagebuffer.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    data['data'] = this.data;
    return data;
  }
}
