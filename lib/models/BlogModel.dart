class BlogModel {
  BlogModel({
      this.status, 
      this.data, 
      this.message,});

  BlogModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? status;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }

}

class Data {
  Data({
      this.items, 
      this.total, 
      this.page, 
      this.size, 
      this.pages,});

  Data.fromJson(dynamic json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    size = json['size'];
    pages = json['pages'];
  }
  List<Items>? items;
  int? total;
  int? page;
  int? size;
  int? pages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['page'] = page;
    map['size'] = size;
    map['pages'] = pages;
    return map;
  }

}

class Items {
  Items({
      this.id, 
      this.title, 
      this.subTitle, 
      this.body1, 
      this.body2, 
      this.body3, 
      this.images, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.isDeleted,});

  Items.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    subTitle = json['sub_title'] != null ? json['sub_title'].cast<String>() : [];
    body1 = json['body1'];
    body2 = json['body2'];
    body3 = json['body3'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isDeleted = json['is_deleted'];
  }
  int? id;
  String? title;
  List<String>? subTitle;
  String? body1;
  String? body2;
  String? body3;
  List<String>? images;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  bool? isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['sub_title'] = subTitle;
    map['body1'] = body1;
    map['body2'] = body2;
    map['body3'] = body3;
    map['images'] = images;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    map['is_deleted'] = isDeleted;
    return map;
  }

}