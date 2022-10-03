class GetProfileModel {
  final String? id;
  final String? userName;
  final String? userEmail;
  final String? userPassword;
  final String? profilePicture;
  final int? number;
  final int? code;
  final int? verified;
  final String? role;
  final String? userAuthentication;
  final dynamic userSocialToken;
  final dynamic userSocialType;
  final dynamic userDeviceType;
  final dynamic userDeviceToken;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  GetProfileModel({
    this.id,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.profilePicture,
    this.number,
    this.code,
    this.verified,
    this.role,
    this.userAuthentication,
    this.userSocialToken,
    this.userSocialType,
    this.userDeviceType,
    this.userDeviceToken,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  GetProfileModel.fromJson(Map<String, dynamic> json)
    : id = json['_id'] as String?,
      userName = json['user_name'] as String?,
      userEmail = json['user_email'] as String?,
      userPassword = json['user_password'] as String?,
      profilePicture = json['profilePicture'],
      number = json['number'] as int?,
      code = json['code'] as int?,
      verified = json['verified'] as int?,
      role = json['role'] as String?,
      userAuthentication = json['user_authentication'] as String?,
      userSocialToken = json['user_social_token'],
      userSocialType = json['user_social_type'],
      userDeviceType = json['user_device_type'],
      userDeviceToken = json['user_device_token'],
      createdAt = json['createdAt'] as String?,
      updatedAt = json['updatedAt'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'user_name' : userName,
    'user_email' : userEmail,
    'user_password' : userPassword,
    'profilePicture' : profilePicture,
    'number' : number,
    'code' : code,
    'verified' : verified,
    'role' : role,
    'user_authentication' : userAuthentication,
    'user_social_token' : userSocialToken,
    'user_social_type' : userSocialType,
    'user_device_type' : userDeviceType,
    'user_device_token' : userDeviceToken,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}