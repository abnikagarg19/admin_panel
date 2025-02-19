class TeamModel {
  TeamModel({
      this.status, 
      this.data, 
      this.message,});

  TeamModel.fromJson(dynamic json) {
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
      this.description, 
      this.id, 
      this.role, 
      this.skills, 
      this.createdAt, 
      this.deletedAt, 
      this.name, 
      this.profileUrl, 
      this.experience, 
      this.linkedin, 
      this.updatedAt, 
      this.isDeleted,});

  Data.fromJson(dynamic json) {
    description = json['description'];
    id = json['id'];
    role = json['role'];
    skills = json['skills'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    name = json['name'];
    profileUrl = json['profile_url'];
    experience = json['experience'];
    linkedin = json['linkedin'];
    updatedAt = json['updated_at'];
    isDeleted = json['is_deleted'];
  }
  String? description;
  int? id;
  String? role;
  String? skills;
  String? createdAt;
  dynamic deletedAt;
  String? name;
  String? profileUrl;
  String? experience;
  dynamic linkedin;
  String? updatedAt;
  bool? isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['id'] = id;
    map['role'] = role;
    map['skills'] = skills;
    map['created_at'] = createdAt;
    map['deleted_at'] = deletedAt;
    map['name'] = name;
    map['profile_url'] = profileUrl;
    map['experience'] = experience;
    map['linkedin'] = linkedin;
    map['updated_at'] = updatedAt;
    map['is_deleted'] = isDeleted;
    return map;
  }

}