// To parse this JSON data, do
//
//     final EmvReqModel = EmvReqModelFromJson(jsonString);

import 'dart:convert';

EmvReqModel EmvReqModelFromJson(String str) => EmvReqModel.fromJson(json.decode(str));

String EmvReqModelToJson(EmvReqModel data) => json.encode(data.toJson());

class EmvReqModel {
    String email;
    String liscenceNumber;
    int loginid;
    String name;
    String organisationName;
    dynamic otp;
    String password;
    int phone;
    dynamic status;
    String type;
    String username;
    String vehicleRegnum;
    String vehicleType;
    int vid;

    EmvReqModel({
        required this.email,
        required this.liscenceNumber,
        required this.loginid,
        required this.name,
        required this.organisationName,
        required this.otp,
        required this.password,
        required this.phone,
        required this.status,
        required this.type,
        required this.username,
        required this.vehicleRegnum,
        required this.vehicleType,
        required this.vid,
    });

    factory EmvReqModel.fromJson(Map<String, dynamic> json) => EmvReqModel(
        email: json["email"],
        liscenceNumber: json["liscence-number"],
        loginid: json["loginid"],
        name: json["name"],
        organisationName: json["organisation-name"],
        otp: json["otp"],
        password: json["password"],
        phone: json["phone"],
        status: json["status"],
        type: json["type"],
        username: json["username"],
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
        "otp": otp,
        "password": password,
        "phone": phone,
        "status": status,
        "type": type,
        "username": username,
        "vehicle-regnum": vehicleRegnum,
        "vehicle-type": vehicleType,
        "vid": vid,
    };
}
