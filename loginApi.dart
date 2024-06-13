import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smartsignalhub/Domain/emergency/emv.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/constants/url.dart';
import 'package:smartsignalhub/services/emv/emvProfileApi.dart';

Future<String?> loginApi(String email,String password) async{
  var client = http.Client();
 Uri url = Uri.parse("$baseUrl/logincheck?UserName=$email&Password=$password");
  try {
    final res = await client.get(url);
  if (res.statusCode == 200) {
    print(res.body);
    final udetails = jsonDecode(res.body);
    if (udetails["task"] == "success") {
      if (udetails["type"]== "user") {
        lid = udetails["loginid"].toString();
        return "user";
      }
      if (udetails["type"]== "emergencyvehicle") {
        lid = udetails["loginid"].toString();
        await emvprofileApi();
        return "emergency";
      }
      if (udetails["type"]== "admin") {
        lid = udetails["loginid"].toString();
        return "admin";
      }
    }
    if (udetails["task"] == "pending"){
      return "pending";
    }
    else{
      print("failed");
      return "failed";
    }
    
    }
    else{
      print("error");
      return "failed";
    }
  }

  catch (e) {
    print("exception : $e");
    return "failed";
  }
}