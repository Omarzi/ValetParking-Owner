class GetAttendanceInStartModel {
  bool? success;
  dynamic? count;
  List<Data>? data;

  GetAttendanceInStartModel({this.success, this.count, this.data});

  GetAttendanceInStartModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? attendanceId;
  Driver? driver;
  Garage? garage;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.attendanceId,
        this.driver,
        this.garage,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    attendanceId = json['attendanceId'];
    driver =
    json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
    garage =
    json['garage'] != null ? new Garage.fromJson(json['garage']) : null;
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendanceId'] = this.attendanceId;
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    if (this.garage != null) {
      data['garage'] = this.garage!.toJson();
    }
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Driver {
  String? driverId;
  String? email;
  String? lat;
  String? lng;
  String? startIn;
  String? date;
  String? status;
  String? createdAt;
  String? updatedAt;

  Driver(
      {this.driverId,
        this.email,
        this.lat,
        this.lng,
        this.startIn,
        this.date,
        this.status,
        this.createdAt,
        this.updatedAt});

  Driver.fromJson(Map<String, dynamic> json) {
    driverId = json['driverId'];
    email = json['email'];
    lat = json['lat'];
    lng = json['lng'];
    startIn = json['startIn'];
    date = json['date'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driverId'] = this.driverId;
    data['email'] = this.email;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['startIn'] = this.startIn;
    data['date'] = this.date;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Garage {
  String? garageId;
  String? garageName;
  String? garageDescription;
  dynamic? garagePricePerHour;
  List<String>? garageImages;
  dynamic? lat;
  dynamic? lng;
  String? openDate;
  String? endDate;
  bool? active;
  String? createdAt;
  String? updatedAt;

  Garage(
      {this.garageId,
        this.garageName,
        this.garageDescription,
        this.garagePricePerHour,
        this.garageImages,
        this.lat,
        this.lng,
        this.openDate,
        this.endDate,
        this.active,
        this.createdAt,
        this.updatedAt});

  Garage.fromJson(Map<String, dynamic> json) {
    garageId = json['garageId'];
    garageName = json['garageName'];
    garageDescription = json['garageDescription'];
    garagePricePerHour = json['garagePricePerHour'];
    garageImages = json['garageImages'].cast<String>();
    lat = json['lat'];
    lng = json['lng'];
    openDate = json['openDate'];
    endDate = json['endDate'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['garageId'] = this.garageId;
    data['garageName'] = this.garageName;
    data['garageDescription'] = this.garageDescription;
    data['garagePricePerHour'] = this.garagePricePerHour;
    data['garageImages'] = this.garageImages;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['openDate'] = this.openDate;
    data['endDate'] = this.endDate;
    data['active'] = this.active;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
