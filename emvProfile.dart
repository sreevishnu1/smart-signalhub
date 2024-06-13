// To parse this JSON data, do
//
//     final EmvProfileModel = EmvProfileModelFromJson(jsonString);

import 'dart:convert';

EmvProfileModel EmvProfileModelFromJson(String str) => EmvProfileModel.fromJson(json.decode(str));

String EmvProfileModelToJson(EmvProfileModel data) => json.encode(data.toJson());

class EmvProfileModel {
    String email;
    String liscenceNumber;
    int loginid;
    String name;
    String organisationName;
    int phone;
    String vehicleRegnum;
    String vehicleType;
    int vid;

    EmvProfileModel({
        required this.email,
        required this.liscenceNumber,
        required this.loginid,
        required this.name,
        required this.organisationName,
        required this.phone,
        required this.vehicleRegnum,
        required this.vehicleType,
        required this.vid,
    });

    factory EmvProfileModel.fromJson(Map<String, dynamic> json) => EmvProfileModel(
        email: json["email"],
        liscenceNumber: json["liscence-number"],
        loginid: json["loginid"],
        name: json["name"],
        organisationName: json["organisation-name"],
        phone: json["phone"],
        vehicleRegnum: json["vehicle-regnum"],
        vehicleType: json["vehicle-type"],
        vid: json["vid"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "liscence-number": liscenceNumber,
        "loginid": loginid,
        "name": name,
        "organisation-name": organisationName,
        "phone": phone,
        "vehicle-regnum": vehicleRegnum,
        "vehicle-type": vehicleType,
        "vid": vid,
    };
}
