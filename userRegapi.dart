

import 'package:http/http.dart' as http;
import 'package:smartsignalhub/Domain/emergency/emv.dart';
import 'package:smartsignalhub/constants/url.dart';

userRegApi(String uname, String email, String pword) async{
  var client = http.Client();
 Uri url = Uri.parse("$baseUrl/userregister");

  try {
    final res = await client.post(url,body: {
    "username": uname,
    "email": email,   
    "password": pword,
  });

  print(res.body);
  if (res.statusCode == 200) {
    return "success";
  }
  else{
    return "failed";
  }
  } catch (e) {
    print("Error : $e");
    return "failed";
  }
}