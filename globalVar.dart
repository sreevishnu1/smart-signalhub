import 'package:flutter/material.dart';
import 'package:smartsignalhub/Domain/admin/emvReqModel.dart';
import 'package:smartsignalhub/Domain/admin/viewNotification.dart';
import 'package:smartsignalhub/Domain/admin/viewfeedbackModel.dart';
import 'package:smartsignalhub/Domain/emergency/emvProfile.dart';
import 'package:smartsignalhub/ViewNotification.dart';

String? lid;
List<EmvProfileModel> emvprofile = [];
ValueNotifier<List<EmvReqModel>> emvrequests = ValueNotifier([]);
ValueNotifier<List<EmvReqModel>> approvedEmv = ValueNotifier([]);
ValueNotifier<List<ViewNotificationsModel>> notifications = ValueNotifier([]);
ValueNotifier<List<ViewfeedbackModel>> feedbacks = ValueNotifier([]);

bool isValidEmail(String email) {
  final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$"
  );
  return emailRegExp.hasMatch(email);
}

bool isValidVehicleNumber(String number) {
  final RegExp vehicleRegExp = RegExp(
    r"^KL \d{2} [A-Z]{1,2} \d{4}$"
  );
  return vehicleRegExp.hasMatch(number);
}

bool isValidName(String input) {
  final RegExp nameRegExp = RegExp(
    r"^[a-zA-Z]+( [a-zA-Z]+)?$"
  );
  return nameRegExp.hasMatch(input);
}

bool isValidCustomFormat(String input) {
  final RegExp customRegExp = RegExp(
    r"^[a-zA-Z]{2}\d{13}$"
  );
  return customRegExp.hasMatch(input);
}
