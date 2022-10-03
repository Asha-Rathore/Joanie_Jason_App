class GetRestaurantModel {
  final int? status;
  final List<Message>? message;

  GetRestaurantModel({
    this.status,
    this.message,
  });

  GetRestaurantModel.fromJson(Map<String, dynamic> json)
    : status = json['status'] as int?,
      message = (json['message'] as List?)?.map((dynamic e) => Message.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'message' : message?.map((e) => e.toJson()).toList()
  };
}

class Message {
  final Location? location;
  final Timing? timing;
  final String? id;
  final String? restName;
  final String? userId;
  final int? number;
  final String? email;
  final int? v;

  Message({
    this.location,
    this.timing,
    this.id,
    this.restName,
    this.userId,
    this.number,
    this.email,
    this.v,
  });

  Message.fromJson(Map<String, dynamic> json)
    : location = (json['location'] as Map<String,dynamic>?) != null ? Location.fromJson(json['location'] as Map<String,dynamic>) : null,
      timing = (json['timing'] as Map<String,dynamic>?) != null ? Timing.fromJson(json['timing'] as Map<String,dynamic>) : null,
      id = json['_id'] as String?,
      restName = json['restName'] as String?,
      userId = json['userId'] as String?,
      number = json['number'] as int?,
      email = json['email'] as String?,
      v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    'location' : location?.toJson(),
    'timing' : timing?.toJson(),
    '_id' : id,
    'restName' : restName,
    'userId' : userId,
    'number' : number,
    'email' : email,
    '__v' : v
  };
}

class Location {
  final String? longitude;
  final String? latitude;

  Location({
    this.longitude,
    this.latitude,
  });

  Location.fromJson(Map<String, dynamic> json)
    : longitude = json['longitude'] as String?,
      latitude = json['latitude'] as String?;

  Map<String, dynamic> toJson() => {
    'longitude' : longitude,
    'latitude' : latitude
  };
}

class Timing {
  final String? monday;
  final String? tuesday;
  final String? wednesday;
  final String? thursday;
  final String? friday;
  final String? saturday;
  final String? sunday;

  Timing({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  Timing.fromJson(Map<String, dynamic> json)
    : monday = json['monday'] as String?,
      tuesday = json['tuesday'] as String?,
      wednesday = json['wednesday'] as String?,
      thursday = json['thursday'] as String?,
      friday = json['friday'] as String?,
      saturday = json['saturday'] as String?,
      sunday = json['sunday'] as String?;

  Map<String, dynamic> toJson() => {
    'monday' : monday,
    'tuesday' : tuesday,
    'wednesday' : wednesday,
    'thursday' : thursday,
    'friday' : friday,
    'saturday' : saturday,
    'sunday' : sunday
  };
}