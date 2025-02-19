class QueriesModel {
  QueriesModel({
      this.status, 
      this.data, 
      this.message,});

  QueriesModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? status;
  List<Data>? data;
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

class Data {
  Data({
      this.firstname, 
      this.emailid, 
      this.subject, 
      this.filelink, 
      this.updatedAt, 
      this.isDeleted, 
      this.phonenumber, 
      this.id, 
      this.lastname, 
      this.queries, 
      this.createdAt, 
      this.deletedAt,});

  Data.fromJson(dynamic json) {
    firstname = json['firstname'];
    emailid = json['emailid'];
    subject = json['subject'];
    filelink = json['filelink'];
    updatedAt = json['updated_at'];
    isDeleted = json['is_deleted'];
    phonenumber = json['phonenumber'];
    id = json['id'];
    lastname = json['lastname'];
    queries = json['queries'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
  }
  String? firstname;
  String? emailid;
  String? subject;
  String? filelink;
  String? updatedAt;
  bool? isDeleted;
  String? phonenumber;
  int? id;
  String? lastname;
  String? queries;
  String? createdAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = firstname;
    map['emailid'] = emailid;
    map['subject'] = subject;
    map['filelink'] = filelink;
    map['updated_at'] = updatedAt;
    map['is_deleted'] = isDeleted;
    map['phonenumber'] = phonenumber;
    map['id'] = id;
    map['lastname'] = lastname;
    map['queries'] = queries;
    map['created_at'] = createdAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}