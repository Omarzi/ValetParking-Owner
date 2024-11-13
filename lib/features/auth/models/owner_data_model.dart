class OwnerDataModel {
  String? message;
  OwnerData? ownerData;
  String? token;

  OwnerDataModel({this.message, this.ownerData, this.token});

  OwnerDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    ownerData = json['ownerData'] != null
        ? new OwnerData.fromJson(json['ownerData'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.ownerData != null) {
      data['ownerData'] = this.ownerData!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class OwnerData {
  String? ownerId;
  String? email;
  String? role;
  String? createdAt;
  String? updatedAt;

  OwnerData(
      {this.ownerId, this.email, this.role, this.createdAt, this.updatedAt});

  OwnerData.fromJson(Map<String, dynamic> json) {
    ownerId = json['ownerId'];
    email = json['email'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ownerId'] = this.ownerId;
    data['email'] = this.email;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
