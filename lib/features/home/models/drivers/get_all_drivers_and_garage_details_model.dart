class GetAllDriversAndGrarageDetailsModel {
  List<Data>? data;

  GetAllDriversAndGrarageDetailsModel({this.data});

  GetAllDriversAndGrarageDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? adminId;
  String? email;
  String? password;
  dynamic? lat;
  dynamic? lng;
  dynamic? salary;
  String? role;
  List<Garage>? garage;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.adminId,
        this.email,
        this.password,
        this.lat,
        this.lng,
        this.salary,
        this.role,
        this.garage,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    adminId = json['adminId'];
    email = json['email'];
    password = json['password'];
    lat = json['lat'];
    lng = json['lng'];
    salary = json['salary'];
    role = json['role'];
    if (json['garage'] != null) {
      garage = <Garage>[];
      json['garage'].forEach((v) {
        garage!.add(new Garage.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adminId'] = this.adminId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['salary'] = this.salary;
    data['role'] = this.role;
    if (this.garage != null) {
      data['garage'] = this.garage!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Garage {
  String? garageId;
  List<String>? garageImages;
  String? gragename;
  String? grageDescription;
  String? grageImages;
  dynamic? gragePricePerHoure;
  dynamic? lat;
  dynamic? lng;
  String? openDate;
  String? endDate;
  bool? active;
  String? createdAt;
  String? updatedAt;

  Garage(
      {this.garageId,
        this.garageImages,
        this.gragename,
        this.grageDescription,
        this.grageImages,
        this.gragePricePerHoure,
        this.lat,
        this.lng,
        this.openDate,
        this.endDate,
        this.active,
        this.createdAt,
        this.updatedAt});

  Garage.fromJson(Map<String, dynamic> json) {
    garageId = json['garageId'];
    garageImages = json['garageImages'].cast<String>();
    gragename = json['gragename'];
    grageDescription = json['grageDescription'];
    grageImages = json['grageImages'];
    gragePricePerHoure = json['gragePricePerHoure'];
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
    data['garageImages'] = this.garageImages;
    data['gragename'] = this.gragename;
    data['grageDescription'] = this.grageDescription;
    data['grageImages'] = this.grageImages;
    data['gragePricePerHoure'] = this.gragePricePerHoure;
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
