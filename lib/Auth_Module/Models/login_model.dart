class LoginModel {
  LoginModel({
    required this.status,
    required this.message,
    required this.token,
    required this.data,
  });
  late final int? status;
  late final String? message;
  late final String? token;
  late final Data data;
  
  LoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    token = json['token'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['token'] = token;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
     this.userSocialToken,
     this.userSocialType,
     this.userDeviceType,
     this.userDeviceToken,
    required this.id,
    required this.number,
    required this.code,
    required this.verified,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.V,
    required this.role,
    required this.userAuthentication,
    required this.updatedAt,
  });
  late final Null? userSocialToken;
  late final Null? userSocialType;
  late final Null? userDeviceType;
  late final Null? userDeviceToken;
  late final String? id;
  late final int? number;
  late final int? code;
  late final int? verified;
  late final String? userName;
  late final String? userEmail;
  late final String? userPassword;
  late final int? V;
  late final String? role;
  late final String? userAuthentication;
  late final String? updatedAt;
  
  Data.fromJson(Map<String, dynamic> json){
    userSocialToken = null;
    userSocialType = null;
    userDeviceType = null;
    userDeviceToken = null;
    id = json['_id'];
    number = json['number'];
    code = json['code'];
    verified = json['verified'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    V = json['__v'];
    role = json['role'];
    userAuthentication = json['user_authentication'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_social_token'] = userSocialToken;
    _data['user_social_type'] = userSocialType;
    _data['user_device_type'] = userDeviceType;
    _data['user_device_token'] = userDeviceToken;
    _data['_id'] = id;
    _data['number'] = number;
    _data['code'] = code;
    _data['verified'] = verified;
    _data['user_name'] = userName;
    _data['user_email'] = userEmail;
    _data['user_password'] = userPassword;
    _data['__v'] = V;
    _data['role'] = role;
    _data['user_authentication'] = userAuthentication;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}