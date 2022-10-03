class GetAllFavoriteModel {
  final int? status;
  final String? message;
  final List<Favourites>? favourites;

  GetAllFavoriteModel({
    this.status,
    this.message,
    this.favourites,
  });

  GetAllFavoriteModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?,
      favourites = (json['favourites'] as List?)?.map((dynamic e) => Favourites.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'favourites' : favourites?.map((e) => e.toJson()).toList()
  };
}

class Favourites {
  final String? id;
  final ProductId? productId;
  final String? userId;
  final int? v;

  Favourites({
    this.id,
    this.productId,
    this.userId,
    this.v,
  });

  Favourites.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      productId = (json['productId'] as Map<String,dynamic>?) != null ? ProductId.fromJson(json['productId'] as Map<String,dynamic>) : null,
      userId = json['userId'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'productId' : productId?.toJson(),
    'userId' : userId,
    '__v' : v
  };
}

class ProductId {
  final String? id;
  final String? productName;
  final String? productDescription;
  final num? productPrice;
  final String? productImage;

  ProductId({
    this.id,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.productImage,
  });

  ProductId.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      productName = json['product_name'] as String?,
      productDescription = json['product_description'] as String?,
      productPrice = json['product_price'],
      productImage = json['product_image'] as String?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'product_name' : productName,
    'product_description' : productDescription,
    'product_price' : productPrice,
    'product_image' : productImage
  };
}