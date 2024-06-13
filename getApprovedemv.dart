
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smartsignalhub/Domain/admin/emvReqModel.dart';
import 'package:smartsignalhub/Domain/emergency/emvProfile.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/constants/url.dart';

Future<String?> approvedEmvApi() async{
  var client = http.Client();
 Uri url = Uri.parse("$baseUrl/viewemvehicleaccepted");
  try {
    final res = await client.get(url);
  if (res.statusCode == 200) {
    print(res.body);
    final udetails = jsonDecode(res.body);
    final resu = (udetails as List).map((e) => EmvReqModel.fromJson(e)).toList();
    approvedEmv.value = resu;
    print("emv: ${emvrequests.value}");
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