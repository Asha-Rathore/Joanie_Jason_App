// class Note {
//   final String? productId;
//   final String? productName;
//   final double? productPrice;
//   Note({
//     this.productId,
//     this.productName,
//     this.productPrice,
//   });

//   factory Note.fromJson(Map<String, dynamic> json) =>
//       Note(
//         productId: json['productId'],
//         productName: json['productName'],
//         productPrice: json['productPrice']
//       );

//   Map<String, dynamic> toJson() => {
//     'productId':productId,
//     'productName': productName,
//     'productPrice':productPrice
//   };
// }

class Note {
  final List<Message>? message;
  // final String? productId;
  // final String? productName;
  // final double? productPrice;
  Note({
    this.message,
  });

  Note.fromJson(Map<String, dynamic> json)
      : message = (json['message'] as List?)?.map((dynamic e) => Message.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'message':message?.map((e) => e.toJson()).toList()
  };
}

class Message{
  final String? productId;
  final String? productName;
  final double? productPrice;
  final int? quantity;

  Message({
    this.productId,
    this.productName,
    this.productPrice,
    this.quantity,
  });

  Message.fromJson(Map<String, dynamic> json)
    : productId = json['productId'] as String?,
      productName = json['productName'] as String?,
      productPrice = json['productPrice'] as double?,
      quantity = json['quantity'] as int?;

  Map<String, dynamic> toJson()=> {
    'productId': productId,
    'productName': productName,
    'productPrice': productPrice,
    'quantity': quantity
  };
}
