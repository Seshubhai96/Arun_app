class UserroleModel {
  String? sId;
  String? rolename;
  String? createdby;

  UserroleModel({this.sId, this.rolename, this.createdby});

  UserroleModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    rolename = json['rolename'];
    createdby = json['createdby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = this.sId;
    data['rolename'] = this.rolename;
    data['createdby'] = this.createdby;
    return data;
  }
}
