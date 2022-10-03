class EditProfileModel {
  EditProfileModel({
    required this.status,
    required this.message,
    required this.user,
  });
  late final int? status;
  late final String? message;
  late final User user;
  
  EditProfileModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.profilePicture,
    required this.number,
     this.code,
    required this.verified,
    required this.role,
    required this.userAuthentication,
     this.userSocialToken,
     this.userSocialType,
     this.userDeviceType,
     this.userDeviceToken,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String? id;
  late final String? userName;
  late final String? userEmail;
  late final String? userPassword;
  late final String? profilePicture;
  late final int? number;
  late final Null? code;
  late final int? verified;
  late final String? role;
  late final String? userAuthentication;
  late final Null? userSocialToken;
  late final Null? userSocialType;
  late final Null? userDeviceType;
  late final Null? userDeviceToken;
  late final String? createdAt;
  late final String? updatedAt;
  late final int? V;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    profilePicture = json['profilePicture'];
    number = json['number'];
    code = null;
    verified = json['verified'];
    role = json['role'];
    userAuthentication = json['user_authentication'];
    userSocialToken = null;
    userSocialType = null;
    userDeviceType = null;
    userDeviceToken = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['user_name'] = userName;
    _data['user_email'] = userEmail;
    _data['user_password'] = userPassword;
    _data['profilePicture'] = profilePicture;
    _data['number'] = number;
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