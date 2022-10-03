class GetSubCategoryModel {
  GetSubCategoryModel({
    required this.status,
    required this.message,
  });
  late final int status;
  late final List<Message> message;
  
  GetSubCategoryModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = List.from(json['message']).map((e)=>Message.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Message {
  Message({
    required this.id,
    required this.parentId,
    required this.categoryName,
    required this.categoryImage,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String? id;
  late final String? parentId;
  late final String? categoryName;
  late final String? categoryImage;
  late final String? createdAt;
  late final String? updatedAt;
  late final int? V;
  
  Message.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    parentId = json['parentId'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['parentId'] = parentId;
    _data['category_name'] = categoryName;
    _data['category_image'] = categoryImage;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}