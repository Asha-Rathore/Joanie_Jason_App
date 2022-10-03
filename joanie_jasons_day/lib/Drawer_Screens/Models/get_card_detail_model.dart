class GetCardDetailsModel {
  final int? status;
  final String? message;
  final List<Message>? data;

  GetCardDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  GetCardDetailsModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?,
      data = (json['data'] as List?)?.map((dynamic e) => Message.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Message {
  final String? id;
  final String? userId;
  final int? cardNumber;
  final int? expMonth;
  final int? expYear;
  final int? cvv;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Message({
    this.id,
    this.userId,
    this.cardNumber,
    this.expMonth,
    this.expYear,
    this.cvv,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Message.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      userId = json['userId'] as String?,
      cardNumber = json['cardNumber'] as int?,
      expMonth = json['exp_month'] as int?,
      expYear = json['exp_year'] as int?,
      cvv = json['cvv'] as int?,
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'userId' : userId,
    'cardNumber' : cardNumber,
    'exp_month' : expMonth,
    'exp_year' : expYear,
    'cvv' : cvv,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}