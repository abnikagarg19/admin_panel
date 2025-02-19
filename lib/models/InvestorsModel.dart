class InvestorsModel {
  InvestorsModel({
      this.status, 
      this.data, 
      this.message,});

  InvestorsModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(InvestorsModelData.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? status;
  List<InvestorsModelData>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

class InvestorsModelData {
  InvestorsModelData({
      this.emailid, 
      this.firstname, 
      this.typeofinvestor, 
      this.createdAt, 
      this.deletedAt, 
      this.companyname, 
      this.id, 
      this.lastname, 
      this.phonenumber, 
      this.fileUrl, 
      this.updatedAt, 
      this.isDeleted,});

  InvestorsModelData.fromJson(dynamic json) {
    emailid = json['emailid'];
    firstname = json['firstname'];
    typeofinvestor = json['typeofinvestor'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    companyname = json['companyname'];
    id = json['id'];
    lastname = json['lastname'];
    phonenumber = json['phonenumber'];
    fileUrl = json['file_url'];
    updatedAt = json['updated_at'];
    isDeleted = json['is_deleted'];
  }
  String? emailid;
  String? firstname;
  String? typeofinvestor;
  String? createdAt;
  dynamic deletedAt;
  String? companyname;
  int? id;
  String? lastname;
  String? phonenumber;
  String? fileUrl;
  String? updatedAt;
  bool? isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emailid'] = emailid;
    map['firstname'] = firstname;
    map['typeofinvestor'] = typeofinvestor;
    map['created_at'] = createdAt;
    map['deleted_at'] = deletedAt;
    map['companyname'] = companyname;
    map['id'] = id;
    map['lastname'] = lastname;
    map['phonenumber'] = phonenumber;
    map['file_url'] = fileUrl;
    map['updated_at'] = updatedAt;
    map['is_deleted'] = isDeleted;
    return map;
  }

}