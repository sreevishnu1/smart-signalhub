// To parse this JSON data, do
//
//     final ViewfeedbackModel = ViewfeedbackModelFromJson(jsonString);

import 'dart:convert';

ViewfeedbackModel ViewfeedbackModelFromJson(String str) => ViewfeedbackModel.fromJson(json.decode(str));

String ViewfeedbackModelToJson(ViewfeedbackModel data) => json.encode(data.toJson());

class ViewfeedbackModel {
    String date;
    String feedback;
    int feedbackId;
    int loginId;

    ViewfeedbackModel({
        required this.date,
        required this.feedback,
        required this.feedbackId,
        required this.loginId,
    });

    factory ViewfeedbackModel.fromJson(Map<String, dynamic> json) => ViewfeedbackModel(
        date: json["date"],
        feedback: json["feedback"],
        feedbackId: json["feedback id"],
        loginId: json["login id"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "feedback": feedback,
        "feedback id": feedbackId,
        "login id": loginId,
    };
}
