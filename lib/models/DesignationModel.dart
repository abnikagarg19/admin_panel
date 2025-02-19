class DesignationModel {
  DesignationModel({
      this.status, 
      this.data, 
      this.message,});

  DesignationModel.fromJson(dynamic json) {
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
      this.mode, 
      this.skills, 
      this.id, 
      this.jobTitle, 
      this.date, 
      this.createdAt, 
      this.deletedAt, 
      this.experience, 
      this.location, 
      this.notes, 
      this.updatedAt, 
      this.isDeleted,});

  Data.fromJson(dynamic json) {
    mode = json['mode'];
    skills = json['skills'];
    id = json['id'];
    jobTitle = json['job_title'];
    date = json['date'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    experience = json['experience'];
    location = json['location'];
    notes = json['notes'];
    updatedAt = json['updated_at'];
    isDeleted = json['is_deleted'];
  }
  String? mode;
  String? skills;
  int? id;
  String? jobTitle;
  String? date;
  String? createdAt;
  dynamic deletedAt;
  String? experience;
  String? location;
  String? notes;
  String? updatedAt;
  bool? isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mode'] = mode;
    map['skills'] = skills;
    map['id'] = id;
    map['job_title'] = jobTitle;
    map['date'] = date;
    map['created_at'] = createdAt;
    map['deleted_at'] = deletedAt;
    map['experience'] = experience;
    map['location'] = location;
    map['notes'] = notes;
    map['updated_at'] = updatedAt;
    map['is_deleted'] = isDeleted;
    return map;
  }

}