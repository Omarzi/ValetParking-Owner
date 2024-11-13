class GarageResponseModel {
  String? status;
  String? message;
  GarageDetails? garageDetails;

  GarageResponseModel({this.status, this.message, this.garageDetails});

  GarageResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    garageDetails = json['garageDetails'] != null
        ? new GarageDetails.fromJson(json['garageDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.garageDetails != null) {
      data['garageDetails'] = this.garageDetails!.toJson();
    }
    return data;
  }
}

class GarageDetails {
  String? garageId;
  String? gragename;
  String? grageDescription;
  List<String>? garageImages;
  int? gragePricePerHoure;
  double? lat;
  double? lng;
  String? openDate;
  String? endDate;
  bool? active;
  List<Driver>? driver;
  List<SubOwner>? subOwner;
  String? createdAt;
  String? updatedAt;

  GarageDetails(
      {this.garageId,
        this.gragename,
        this.grageDescription,
        this.garageImages,
        this.gragePricePerHoure,
        this.lat,
        this.lng,
        this.openDate,
        this.endDate,
        this.active,
        this.driver,
        this.subOwner,
        this.createdAt,
        this.updatedAt});

  GarageDetails.fromJson(Map<String, dynamic> json) {
    garageId = json['garageId'];
    gragename = json['gragename'];
    grageDescription = json['grageDescription'];
    garageImages = json['garageImages'].cast<String>();
    gragePricePerHoure = json['gragePricePerHoure'];
    lat = json['lat'];
    lng = json['lng'];
    openDate = json['openDate'];
    endDate = json['endDate'];
    active = json['active'];
    if (json['driver'] != null) {
      driver = <Driver>[];
      json['driver'].forEach((v) {
        driver!.add(new Driver.fromJson(v));
      });
    }
    if (json['subOwner'] != null) {
      subOwner = <SubOwner>[];
      json['subOwner'].forEach((v) {
        subOwner!.add(new SubOwner.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['garageId'] = this.garageId;
    data['gragename'] = this.gragename;
    data['grageDescription'] = this.grageDescription;
    data['garageImages'] = this.garageImages;
    data['gragePricePerHoure'] = this.gragePricePerHoure;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['openDate'] = this.openDate;
    data['endDate'] = this.endDate;
    data['active'] = this.active;
    if (this.driver != null) {
      data['driver'] = this.driver!.map((v) => v.toJson()).toList();
    }
    if (this.subOwner != null) {
      data['subOwner'] = this.subOwner!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Driver {
  String? sId;
  String? email;
  String? password;
  double? lat;
  double? lng;
  int? salary;
  String? role;
  String? createdAt;
  String? updatedAt;

  Driver(
      {this.sId,
        this.email,
        this.password,
        this.lat,
        this.lng,
        this.salary,
        this.role,
        this.createdAt,
        this.updatedAt});

  Driver.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    lat = json['lat'];
    lng = json['lng'];
    salary = json['salary'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['salary'] = this.salary;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class SubOwner {
  String? sId;
  String? email;
  String? password;
  double? lat;
  double? lng;
  int? salary;
  String? role;
  String? createdAt;
  String? updatedAt;
  bool? passwordResetVerified;

  SubOwner(
      {this.sId,
        this.email,
        this.password,
        this.lat,
        this.lng,
        this.salary,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.passwordResetVerified});

  SubOwner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    lat = json['lat'];
    lng = json['lng'];
    salary = json['salary'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    passwordResetVerified = json['passwordResetVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['salary'] = this.salary;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['passwordResetVerified'] = this.passwordResetVerified;
    return data;
  }
}
