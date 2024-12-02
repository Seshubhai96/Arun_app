class Roommodel {
  String? sId;
  String? roomnumber;
  String? type;
  String? createdby;

  Roommodel({this.sId, this.roomnumber, this.type, this.createdby});

  Roommodel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    roomnumber = json['roomnumber'];
    type = json['type'];
    createdby = json['createdby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['roomnumber'] = roomnumber;
    data['type'] = type;
    data['createdby'] = createdby;
    return data;
  }
}
