class SignupModel {
  SignupModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int? status;
  late final String? message;
  late final Data data;
  
  SignupModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.userId,
  });
  late final String userId;
  
  Data.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    return _data;
  }
}