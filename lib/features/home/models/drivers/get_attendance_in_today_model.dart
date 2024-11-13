class GetAttendanceInTodayModel {
  String? status;
  List<Attend>? attend;

  GetAttendanceInTodayModel({this.status, this.attend});

  GetAttendanceInTodayModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['attend'] != null) {
      attend = <Attend>[];
      json['attend'].forEach((v) {
        attend!.add(new Attend.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.attend != null) {
      data['attend'] = this.attend!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attend {
  String? attendanceId;
  String? lat;
  String? lng;
  Garage? garage;
  Driver? driver;
  String? startIn;
  String? endtIn;
  String? createdAt;
  String? updatedAt;

  Attend(
      {this.attendanceId,
        this.lat,
        this.lng,
        this.garage,
        this.driver,
        this.startIn,
        this.endtIn,
        this.createdAt,
        this.updatedAt});

  Attend.fromJson(Map<String, dynamic> json) {
    attendanceId = json['attendanceId'];
    lat = json['lat'];
    lng = json['lng'];
    garage =
    json['garage'] != null ? new Garage.fromJson(json['garage']) : null;
    driver =
    json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
    startIn = json['startIn'];
    endtIn = json['endtIn'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendanceId'] = this.attendanceId;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    if (this.garage != null) {
      data['garage'] = this.garage!.toJson();
    }
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    data['startIn'] = this.startIn;
    data['endtIn'] = this.endtIn;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Garage {
  String? garageId;
  String? garageName;
  String? garageDescription;
  List<String>? garageImages;
  dynamic? pricePerHour;
  dynamic? lat;
  dynamic? lng;
  String? openDate;
  String? endDate;
  bool? active;
  List<String>? drivers;
  List<String>? subOwners;

  Garage(
      {this.garageId,
        this.garageName,
        this.garageDescription,
        this.garageImages,
        this.pricePerHour,
        this.lat,
        this.lng,
        this.openDate,
        this.endDate,
        this.active,
        this.drivers,
        this.subOwners});

  Garage.fromJson(Map<String, dynamic> json) {
    garageId = json['garageId'];
    garageName = json['garageName'];
    garageDescription = json['garageDescription'];
    garageImages = json['garageImages'].cast<String>();
    pricePerHour = json['pricePerHour'];
    lat = json['lat'];
    lng = json['lng'];
    openDate = json['openDate'];
    endDate = json['endDate'];
    active = json['active'];
    drivers = json['drivers'].cast<String>();
    subOwners = json['subOwners'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['garageId'] = this.garageId;
    data['garageName'] = this.garageName;
    data['garageDescription'] = this.garageDescription;
    data['garageImages'] = this.garageImages;
    data['pricePerHour'] = this.pricePerHour;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['openDate'] = this.openDate;
    data['endDate'] = this.endDate;
    data['active'] = this.active;
    data['drivers'] = this.drivers;
    data['subOwners'] = this.subOwners;
    return data;
  }
}

class Driver {
  String? driverId;
  String? email;
  dynamic? lat;
  dynamic? lng;
  dynamic? salary;
  String? role;
  String? passwordChangedAt;

  Driver(
      {this.driverId,
        this.email,
        this.lat,
        this.lng,
        this.salary,
        this.role,
        this.passwordChangedAt});

  Driver.fromJson(Map<String, dynamic> json) {
    driverId = json['driverId'];
    email = json['email'];
    lat = json['lat'];
    lng = json['lng'];
    salary = json['salary'];
    role = json['role'];
    passwordChangedAt = json['passwordChangedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driverId'] = this.driverId;
    data['email'] = this.email;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['salary'] = this.salary;
    data['role'] = this.role;
    data['passwordChangedAt'] = this.passwordChangedAt;
    return data;
  }
}
