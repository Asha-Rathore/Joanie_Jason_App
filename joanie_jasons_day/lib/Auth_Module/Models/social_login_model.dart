class SocialLoginModel {
  SocialLoginModel({
    required this.status,
    required this.message,
    required this.token,
    required this.data,
  });
  late final int status;
  late final String message;
  late final String token;
  late final Data data;
  
  SocialLoginModel.fromJson(Map<String, dynamic> json){
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
     this.profilePicture,
    required this.id,
     this.code,
    required this.verified,
    required this.role,
    required this.userAuthentication,
    required this.userSocialToken,
    required this.userSocialType,
    required this.userDeviceType,
    required this.userDeviceToken,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final Null profilePicture;
  late final String id;
  late final Null code;
  late final int verified;
  late final String role;
  late final String userAuthentication;
  late final String userSocialToken;
  late final String userSocialType;
  late final String userDeviceType;
  late final String userDeviceToken;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  
  Data.fromJson(Map<String, dynamic> json){
    profilePicture = null;
    id = json['_id'];
    code = null;
    verified = json['verified'];
    role = json['role'];
    userAuthentication = json['user_authentication'];
    userSocialToken = json['user_social_token'];
    userSocialType = json['user_social_type'];
    userDeviceType = json['user_device_type'];
    userDeviceToken = json['user_device_token'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['profilePicture'] = profilePicture;
    _data['_id'] = id;
    _data['code'] = code;
    _data['verified'] = verified;
    _data['role'] = role;
    _data['user_authentication'] = userAuthentication;
    _data['user_social_token'] = userSocialToken;
    _data['user_social_type'] = userSocialType;
    _data['user_device_type'] = userDeviceType;
    _data['user_device_token'] = userDeviceToken;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}