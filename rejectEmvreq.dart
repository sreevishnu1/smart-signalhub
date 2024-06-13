import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartsignalhub/constants/url.dart';

Future<bool?> rejectEmvApi(String vid) async{
  var client = http.Client();
 Uri url = Uri.parse("$baseUrl/rejectvehicle?vlog=$vid");
  try {
    final res = await client.get(url);
  if (res.statusCode == 200) {
    print(res.body);
    final udetails = jsonDecode(res.body);
    if (udetails["task"]=="success") {
      return true;
    }
    //final resu = (udetails as List).map((e) => EmvReqModel.fromJson(e)).toList();
    //emvrequests = resu;
    }
    else{
      print("error");
      // return "failed";
    }
  }

  catch (e) {
    print("exception : $e");
    // return "failed";
  }
}