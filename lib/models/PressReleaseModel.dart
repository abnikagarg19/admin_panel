class PressReleaseModel {
  PressReleaseModel({
      this.status, 
      this.data, 
      this.message,});

  PressReleaseModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(PressReleaseModelData.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? status;
  List<PressReleaseModelData>? data;
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

class PressReleaseModelData {
  PressReleaseModelData({
      this.phonenumber, 
      this.question, 
      this.filelink, 
      this.updatedAt, 
      this.isDeleted, 
      this.name, 
      this.subject, 
      this.id, 
      this.emailid, 
      this.title, 
      this.createdAt, 
      this.deletedAt,});

  PressReleaseModelData.fromJson(dynamic json) {
    phonenumber = json['phonenumber'];
    question = json['question'];
    filelink = json['filelink'];
    updatedAt = json['updated_at'];
    isDeleted = json['is_deleted'];
    name = json['name'];
    subject = json['subject'];
    id = json['id'];
    emailid = json['emailid'];
    title = json['title'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
  }
  String? phonenumber;
  String? question;
  String? filelink;
  String? updatedAt;
  bool? isDeleted;
  String? name;
  String? subject;
  int? id;
  String? emailid;
  String? title;
  String? createdAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phonenumber'] = phonenumber;
    map['question'] = question;
    map['filelink'] = filelink;
    map['updated_at'] = updatedAt;
    map['is_deleted'] = isDeleted;
    map['name'] = name;
    map['subject'] = subject;
    map['id'] = id;
    map['emailid'] = emailid;
    map['title'] = title;
    map['created_at'] = createdAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}