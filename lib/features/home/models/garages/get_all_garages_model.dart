class GetAllGaragesModel {
  List<GarageDetails>? garageDetails;

  GetAllGaragesModel({this.garageDetails});

  GetAllGaragesModel.fromJson(Map<String, dynamic> json) {
    if (json['Garage Details'] != null) {
      garageDetails = <GarageDetails>[];
      json['Garage Details'].forEach((v) {
        garageDetails!.add(new GarageDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.garageDetails != null) {
      data['Garage Details'] =
          this.garageDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GarageDetails {
  String? garageId;
  String? gragename;
  String? grageDescription;
  List<String>? grageImages;
  dynamic? gragePricePerHoure;
  dynamic? lat;
  dynamic? lng;
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
        this.grageImages,
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
    grageImages = json['grageImages'].cast<String>();
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
    data['grageImages'] = this.grageImages;
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
  String? driverId;
  String? name;
  String? email;
  String? phone;

  Driver({this.driverId, this.name, this.email, this.phone});

  Driver.fromJson(Map<String, dynamic> json) {
    driverId = json['driverId'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driverId'] = this.driverId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class SubOwner {
  String? subOwnerId;
  String? name;
  String? email;
  String? phone;

  SubOwner({this.subOwnerId, this.name, this.email, this.phone});

  SubOwner.fromJson(Map<String, dynamic> json) {
    subOwnerId = json['subOwnerId'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subOwnerId'] = this.subOwnerId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}


// class GetAllGaragesModel {
//   List<GarageDetails>? garageDetails;
//
//   GetAllGaragesModel({this.garageDetails});
//
//   GetAllGaragesModel.fromJson(Map<String, dynamic> json) {
//     if (json['Garage Details'] != null) {
//       garageDetails = <GarageDetails>[];
//       json['Garage Details'].forEach((v) {
//         garageDetails!.add(new GarageDetails.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.garageDetails != null) {
//       data['Garage Details'] =
//           this.garageDetails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class GarageDetails {
//   String? garageId;
//   String? gragename;
//   String? grageDescription;
//   String? grageImages;
//   dynamic? gragePricePerHoure;
//   dynamic? lat;
//   dynamic? lng;
//   String? openDate;
//   String? endDate;
//   bool? active;
//   List<Driver>? driver;
//   List<String>? subOwner;
//   String? createdAt;
//   String? updatedAt;
//
//   GarageDetails(
//       {this.garageId,
//         this.gragename,
//         this.grageDescription,
//         this.grageImages,
//         this.gragePricePerHoure,
//         this.lat,
//         this.lng,
//         this.openDate,
//         this.endDate,
//         this.active,
//         this.driver,
//         this.subOwner,
//         this.createdAt,
//         this.updatedAt});
//
//   GarageDetails.fromJson(Map<String, dynamic> json) {
//     garageId = json['garageId'];
//     gragename = json['gragename'];
//     grageDescription = json['grageDescription'];
//     grageImages = json['grageImages'];
//     gragePricePerHoure = json['gragePricePerHoure'];
//     lat = json['lat'];
//     lng = json['lng'];
//     openDate = json['openDate'];
//     endDate = json['endDate'];
//     active = json['active'];
//     if (json['driver'] != null) {
//       driver = <Driver>[];
//       json['driver'].forEach((v) {
//         driver!.add(new Driver.fromJson(v));
//       });
//     }
//     subOwner = json['subOwner'].cast<String>();
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['garageId'] = this.garageId;
//     data['gragename'] = this.gragename;
//     data['grageDescription'] = this.grageDescription;
//     data['grageImages'] = this.grageImages;
//     data['gragePricePerHoure'] = this.gragePricePerHoure;
//     data['lat'] = this.lat;
//     data['lng'] = this.lng;
//     data['openDate'] = this.openDate;
//     data['endDate'] = this.endDate;
//     data['active'] = this.active;
//     if (this.driver != null) {
//       data['driver'] = this.driver!.map((v) => v.toJson()).toList();
//     }
//     data['subOwner'] = this.subOwner;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }
//
// class Driver {
//   String? driverId;
//   String? name;
//   String? email;
//   String? phone;
//
//   Driver({this.driverId, this.name, this.email, this.phone});
//
//   Driver.fromJson(Map<String, dynamic> json) {
//     driverId = json['driverId'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['driverId'] = this.driverId;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     return data;
//   }
// }
//
//
// // class GetAllGaragesModel {
// //   List<GarageDetails>? garageDetails;
// //
// //   GetAllGaragesModel({this.garageDetails});
// //
// //   GetAllGaragesModel.fromJson(Map<String, dynamic> json) {
// //     if (json['Garage Details'] != null) {
// //       garageDetails = <GarageDetails>[];
// //       json['Garage Details'].forEach((v) {
// //         garageDetails!.add(new GarageDetails.fromJson(v));
// //       });
// //     }
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     if (this.garageDetails != null) {
// //       data['Garage Details'] =
// //           this.garageDetails!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }
// //
// // class GarageDetails {
// //   String? garageId;
// //   String? gragename;
// //   String? grageDescription;
// //   String? grageImages;
// //   dynamic? gragePricePerHoure;
// //   dynamic? lat;
// //   dynamic? lng;
// //   String? openDate;
// //   String? endDate;
// //   bool? active;
// //   List<String>? driver;
// //   List<String>? subOwner;
// //   String? createdAt;
// //   String? updatedAt;
// //
// //   GarageDetails(
// //       {this.garageId,
// //         this.gragename,
// //         this.grageDescription,
// //         this.grageImages,
// //         this.gragePricePerHoure,
// //         this.lat,
// //         this.lng,
// //         this.openDate,
// //         this.endDate,
// //         this.active,
// //         this.driver,
// //         this.subOwner,
// //         this.createdAt,
// //         this.updatedAt});
// //
// //   GarageDetails.fromJson(Map<String, dynamic> json) {
// //     garageId = json['garageId'];
// //     gragename = json['gragename'];
// //     grageDescription = json['grageDescription'];
// //     grageImages = json['grageImages'];
// //     gragePricePerHoure = json['gragePricePerHoure'];
// //     lat = json['lat'];
// //     lng = json['lng'];
// //     openDate = json['openDate'];
// //     endDate = json['endDate'];
// //     active = json['active'];
// //     driver = json['driver'].cast<String>();
// //     subOwner = json['subOwner'].cast<String>();
// //     createdAt = json['createdAt'];
// //     updatedAt = json['updatedAt'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['garageId'] = this.garageId;
// //     data['gragename'] = this.gragename;
// //     data['grageDescription'] = this.grageDescription;
// //     data['grageImages'] = this.grageImages;
// //     data['gragePricePerHoure'] = this.gragePricePerHoure;
// //     data['lat'] = this.lat;
// //     data['lng'] = this.lng;
// //     data['openDate'] = this.openDate;
// //     data['endDate'] = this.endDate;
// //     data['active'] = this.active;
// //     data['driver'] = this.driver;
// //     data['subOwner'] = this.subOwner;
// //     data['createdAt'] = this.createdAt;
// //     data['updatedAt'] = this.updatedAt;
// //     return data;
// //   }
// // }
