class GetPastOrderModel {
  final int? status;
  final List<GetOrders>? getOrders;

  GetPastOrderModel({
    this.status,
    this.getOrders,
  });

  GetPastOrderModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      getOrders = (json['getOrders'] as List?)?.map((dynamic e) => GetOrders.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'getOrders' : getOrders?.map((e) => e.toJson()).toList()
  };
}

class GetOrders {
  final String? id;
  final String? userId;
  final List<Products>? products;
  final int? orderId;
  final int? orderPrice;
  final int? orderStatus;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  GetOrders({
    this.id,
    this.userId,
    this.products,
    this.orderId,
    this.orderPrice,
    this.orderStatus,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  GetOrders.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      userId = json['userId'] as String?,
      products = (json['products'] as List?)?.map((dynamic e) => Products.fromJson(e as Map<String,dynamic>)).toList(),
      orderId = json['orderId'] as int?,
      orderPrice = json['orderPrice'] as int?,
      orderStatus = json['orderStatus'] as int?,
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'userId' : userId,
    'products' : products?.map((e) => e.toJson()).toList(),
    'orderId' : orderId,
    'orderPrice' : orderPrice,
    'orderStatus' : orderStatus,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}

class Products {
  final ProductId? productId;
  final int? quantity;
  final String? id;

  Products({
    this.productId,
    this.quantity,
    this.id,
  });

  Products.fromJson(Map<String, dynamic> json)
    : productId = (json['productId'] as Map<String,dynamic>?) != null ? ProductId.fromJson(json['productId'] as Map<String,dynamic>) : null,
      quantity = json['quantity'] as int?,
      id = json['_id'] as String?;

  Map<String, dynamic> toJson() => {
    'productId' : productId?.toJson(),
    'quantity' : quantity,
    '_id' : id
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