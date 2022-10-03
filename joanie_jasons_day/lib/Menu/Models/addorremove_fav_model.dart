class AddOrRemoveFavoriteModel {
  final int? status;
  final String? message;

  AddOrRemoveFavoriteModel({
    this.status,
    this.message,
  });

  AddOrRemoveFavoriteModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message
  };
}