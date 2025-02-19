class JobApplyModel {
  JobApplyModel({
      this.status, 
      this.data, 
      this.message,});

  JobApplyModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(JobApplyModelData.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? status;
  List<JobApplyModelData>? data;
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

class JobApplyModelData {
  JobApplyModelData({
      this.designation, 
      this.lastname, 
      this.linkedin, 
      this.experience, 
      this.createdAt, 
      this.updatedAt, 
      this.emailid, 
      this.id, 
      this.firstname, 
      this.phonenumber, 
      this.resumeUrl, 
      this.deletedAt, 
      this.isDeleted,});

  JobApplyModelData.fromJson(dynamic json) {
    designation = json['designation'];
    lastname = json['lastname'];
    linkedin = json['linkedin'];
    experience = json['experience'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    emailid = json['emailid'];
    id = json['id'];
    firstname = json['firstname'];
    phonenumber = json['phonenumber'];
    resumeUrl = json['resume_url'];
    deletedAt = json['deleted_at'];
    isDeleted = json['is_deleted'];
  }
  String? designation;
  String? lastname;
  String? linkedin;
  String? experience;
  String? createdAt;
  String? updatedAt;
  String? emailid;
  int? id;
  String? firstname;
  String? phonenumber;
  String? resumeUrl;
  dynamic deletedAt;
  bool? isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['designation'] = designation;
    map['lastname'] = lastname;
    map['linkedin'] = linkedin;
    map['experience'] = experience;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['emailid'] = emailid;
    map['id'] = id;
    map['firstname'] = firstname;
    map['phonenumber'] = phonenumber;
    map['resume_url'] = resumeUrl;
    map['deleted_at'] = deletedAt;
    map['is_deleted'] = isDeleted;
    return map;
  }

}