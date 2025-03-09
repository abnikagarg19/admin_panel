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
      this.skills, 
      this.mode, 
      this.experience, 
      this.date, 
      this.description, 
      this.keyresponsibilty, 
      this.offer, 
      this.jobtype, 
      this.updatedAt, 
      this.isDeleted, 
      this.jobTitle, 
      this.id, 
      this.location, 
      this.notes, 
      this.qualification, 
      this.createdAt, 
      this.deletedAt,});

  Data.fromJson(dynamic json) {
    if (json['skills'] != null) {
      skills = [];
      json['skills'].forEach((v) {
        skills?.add(Skills.fromJson(v));
      });
    }
    mode = json['mode'];
    experience = json['experience'];
    date = json['date'];
    description = json['description'];
    keyresponsibilty = json['keyresponsibilty'] != null ? json['keyresponsibilty'].cast<String>() : [];
    if (json['offer'] != null) {
      offer = [];
      json['offer'].forEach((v) {
        offer?.add(Offer.fromJson(v));
      });
    }
    jobtype = json['jobtype'];
    updatedAt = json['updated_at'];
    isDeleted = json['is_deleted'];
    jobTitle = json['job_title'];
    id = json['id'];
    location = json['location'];
    notes = json['notes'];
    qualification = json['qualification'] != null ? json['qualification'].cast<String>() : [];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
  }
  List<Skills>? skills;
  String? mode;
  String? experience;
  String? date;
  String? description;
  List<String>? keyresponsibilty;
  List<Offer>? offer;
  String? jobtype;
  String? updatedAt;
  bool? isDeleted;
  String? jobTitle;
  int? id;
  String? location;
  String? notes;
  List<String>? qualification;
  String? createdAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (skills != null) {
      map['skills'] = skills?.map((v) => v.toJson()).toList();
    }
    map['mode'] = mode;
    map['experience'] = experience;
    map['date'] = date;
    map['description'] = description;
    map['keyresponsibilty'] = keyresponsibilty;
    if (offer != null) {
      map['offer'] = offer?.map((v) => v.toJson()).toList();
    }
    map['jobtype'] = jobtype;
    map['updated_at'] = updatedAt;
    map['is_deleted'] = isDeleted;
    map['job_title'] = jobTitle;
    map['id'] = id;
    map['location'] = location;
    map['notes'] = notes;
    map['qualification'] = qualification;
    map['created_at'] = createdAt;
    map['deleted_at'] = deletedAt;
    return map;
  }

}

class Offer {
  Offer({
      this.title, 
      this.description,});

  Offer.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
  }
  String? title;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    return map;
  }

}

class Skills {
  Skills({
      this.title, 
      this.description,});

  Skills.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
  }
  String? title;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    return map;
  }

}