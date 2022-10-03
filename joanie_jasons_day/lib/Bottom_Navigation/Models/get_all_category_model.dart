class GetAllCategoryModel {
  final int? status;
  final List<Message>? message;

  GetAllCategoryModel({
    this.status,
    this.message,
  });

  GetAllCategoryModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = (json['message'] as List?)?.map((dynamic e) => Message.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message?.map((e) => e.toJson()).toList()
  };
}

class Message {
  final String? id;
  final String? parentId;
  final String? categoryName;
  final String? categoryImage;
  final String? restaurantId;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Message({
    this.id,
    this.parentId,
    this.categoryName,
    this.categoryImage,
    this.restaurantId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Message.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      parentId = json['parentId'] as String?,
      categoryName = json['category_name'] as String?,
      categoryImage = json['category_image'] as String?,
      restaurantId = json['restaurantId'] as String?,
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'parentId' : parentId,
    'category_name' : categoryName,
    'category_image' : categoryImage,
    'restaurantId' : restaurantId,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}