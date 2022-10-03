import 'dart:ffi';

class GetAllProductsModel {
  final List<Message>? data;

  GetAllProductsModel({
    this.data,
  });

  GetAllProductsModel.fromJson(Map<String, dynamic> json)
    : data = (json['Data'] as List?)?.map((dynamic e) => Message.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'Data' : data?.map((e) => e.toJson()).toList()
  };
}

class Message {
  final String? id;
  final int? quantity;
  final String? productName;
  final String? productDescription;
  final num? productPrice;
  final String? productImage;
  final String? categoryId;
  final int? v;
  final List<dynamic>? isFavourite;

  Message({
    this.id,
    this.quantity,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.productImage,
    this.categoryId,
    this.v,
    this.isFavourite,
  });

  Message.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      quantity = json['quantity'] as int?,
      productName = json['product_name'] as String?,
      productDescription = json['product_description'] as String?,
      productPrice = json['product_price'],
      productImage = json['product_image'] as String?,
      categoryId = json['categoryId'] as String?,
      v = json['__v'] as int?,
      isFavourite = json['isFavourite'] as List?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'quantity' : quantity,
    'product_name' : productName,
    'product_description' : productDescription,
    'product_price' : productPrice,
    'product_image' : productImage,
    'categoryId' : categoryId,
    '__v' : v,
    'isFavourite' : isFavourite
  };
}

// class IsFavourite {
//   IsFavourite({
//     required this.id,
//     required this.productId,
//     required this.userId,
//     required this.V,
//   });
//   late final String id;
//   late final String productId;
//   late final String userId;
//   late final int V;
  
//   IsFavourite.fromJson(Map<String, dynamic> json){
//     id = json['_id'];
//     productId = json['productId'];
//     userId = json['userId'];
//     V = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['_id'] = id;
//     _data['productId'] = productId;
//     _data['userId'] = userId;
//     _data['__v'] = V;
//     return _data;
//   }
// }