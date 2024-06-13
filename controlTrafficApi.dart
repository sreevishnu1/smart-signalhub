import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smartsignalhub/Domain/emergency/emv.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/constants/url.dart';
import 'package:smartsignalhub/services/emv/emvProfileApi.dart';

String? cUrl;

Future<String?> conTrolTrafficApi(String st) async{
  print(st);
  var client = http.Client();
 Uri url = Uri.parse("http://${cUrl}:5000/control");
  try {
    final res = await client.post(url,body: {"data":st});
  if (res.statusCode == 200) {
    print(res.body);
    final udetails = jsonDecode(res.body);
    
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