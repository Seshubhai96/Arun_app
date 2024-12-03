import 'package:arunmall/env/appexports.dart';

class Roommodel {
  String? sId;
  TextEditingController? roomnumber;
  String? type;
  String? createdby;

  Roommodel({this.sId, this.roomnumber, this.type, this.createdby});

  Roommodel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    roomnumber = TextEditingController.fromValue(TextEditingValue(text: json['roomnumber']??""));
    type = json['type'];
    createdby = json['createdby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['roomnumber'] = roomnumber?.text;
    data['type'] = type;
    data['createdby'] = createdby;
    return data;
  }
   Map<String, dynamic> createjson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomnumber'] = roomnumber?.text;
    data['type'] = type;
    return data;
  }
}
