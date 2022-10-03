class ProductDetailsModel {
  final Message? message;

  ProductDetailsModel({
    this.message,
  });

  ProductDetailsModel.fromJson(Map<String, dynamic> json)
    : message = (json['message'] as Map<String,dynamic>?) != null ? Message.fromJson(json['message'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'message' : message?.toJson()
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

  Message({
    this.id,
    this.quantity,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.productImage,
    this.categoryId,
    this.v,
  });

  Message.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      quantity = json['quantity'] as int?,
      productName = json['product_name'] as String?,
      productDescription = json['product_description'] as String?,
      productPrice = json['product_price'],
      productImage = json['product_image'] as String?,
      categoryId = json['categoryId'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'quantity' : quantity,
    'product_name' : productName,
    'product_description' : productDescription,
    'product_price' : productPrice,
    'product_image' : productImage,
    'categoryId' : categoryId,
    '__v' : v
  };
}