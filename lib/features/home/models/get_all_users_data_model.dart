class GetAllUserDataModel {
  List<Data>? data;

  GetAllUserDataModel({this.data});

  GetAllUserDataModel.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? username;
  String? email;
  String? phone;
  String? carName;
  String? carNumber;
  List<SavedGarages>? savedGarages;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.userId,
        this.username,
        this.email,
        this.phone,
        this.carName,
        this.carNumber,
        this.savedGarages,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    carName = json['carName'];
    carNumber = json['carNumber'];
    if (json['savedGarages'] != null) {
      savedGarages = <SavedGarages>[];
      json['savedGarages'].forEach((v) {
        savedGarages!.add(new SavedGarages.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['carName'] = this.carName;
    data['carNumber'] = this.carNumber;
    if (this.savedGarages != null) {
      data['savedGarages'] = this.savedGarages!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class SavedGarages {
  String? garageId;
  List<String>? garageImages;
  String? garageName;
  String? garageDescription;
  dynamic? garagePricePerHour;
  dynamic? lat;
  dynamic? lng;
  String? openDate;
  String? endDate;
  bool? active;

  SavedGarages(
      {this.garageId,
        this.garageImages,
        this.garageName,
        this.garageDescription,
        this.garagePricePerHour,
        this.lat,
        this.lng,
        this.openDate,
        this.endDate,
        this.active});

  SavedGarages.fromJson(Map<String, dynamic> json) {
    garageId = json['garageId'];
    garageImages = json['garageImages'].cast<String>();
    garageName = json['garageName'];
    garageDescription = json['garageDescription'];
    garagePricePerHour = json['garagePricePerHour'];
    lat = json['lat'];
    lng = json['lng'];
    openDate = json['openDate'];
    endDate = json['endDate'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['garageId'] = this.garageId;
    data['garageImages'] = this.garageImages;
    data['garageName'] = this.garageName;
    data['garageDescription'] = this.garageDescription;
    data['garagePricePerHour'] = this.garagePricePerHour;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['openDate'] = this.openDate;
    data['endDate'] = this.endDate;
    data['active'] = this.active;
    return data;
  }
}
