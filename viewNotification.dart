import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartsignalhub/Domain/admin/emvReqModel.dart';
import 'package:smartsignalhub/Domain/admin/viewNotification.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/constants/url.dart';

Future<void> viewNotificationApi() async{
  var client = http.Client();
 Uri url = Uri.parse("$baseUrl/viewnotification");
  try {
    final res = await client.get(url);
  if (res.statusCode == 200) {
    print(res.body);
    final udetails = jsonDecode(res.body);
    final resu = (udetails as List).map((e) => ViewNotificationsModel .fromJson(e)).toList();
    notifications.value = resu;
    // print("emv: ${emvrequests.value}");
    }
    else{
      print("error");
      //return "failed";
    }
  }

  catch (e) {
    print("exception : $e");
    // return "failed";
  }
}