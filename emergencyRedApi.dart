import 'package:http/http.dart' as http;
import 'package:smartsignalhub/Domain/emergency/emv.dart';
import 'package:smartsignalhub/constants/url.dart';

emergencyRegApi(EmergencyRegModel user) async{
  var client = http.Client();
 Uri url = Uri.parse("$baseUrl/emergencyvehicleregister");

  try {
    final res = await client.post(url,body: {
    "name":user.Username,
    "email":user.Email,
    "phone":user.Phone,    
    "password":user.Password,
    "organisationname":user.Organizationname,
    "liscenceno":user.liscencenumber,
    "vehicleregno":user.Vehicleregnumber,
    "vehicletype":user.Vehicletype,
  });

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