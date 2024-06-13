
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartsignalhub/constants/url.dart';
import 'package:smartsignalhub/screens/forgotOtpScreen.dart';
import 'package:smartsignalhub/screens/loginNew.dart';


// send email
Future<void> sendEmail(
  context,
  String email,
) async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/forgotpassword?email=$email'),
      
    );

    print('hello');
    print(response.statusCode);
    print(response.body);

    // Map data = jsonDecode(response.body);
    print(response.body);

    if (response.statusCode == 200) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context){return OtpScreen(email: email,);}));
      
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("email send successfully to $email"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(10),
                          duration: Duration(seconds: 8)
                        ));
      
    } else {
      // Handle other status codes (e.g., 401 for unauthorized)
      print(' Failed');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("You are not a registered user"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(10),
                          duration: Duration(seconds: 8)
                        ));
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
  }
}

// send otp and new  password

Future<void> sendPassword(
    BuildContext context, String email, String password, String otp) async {
  print('hhhhhhhhhhhhhhhh');

  // Create Dio instance and configure it
  Dio dio = Dio();
  //dio.options.baseUrl = 'http://192.168.132.34:5000';

  try {
    final response = await dio.post(
      '$baseUrl/checkotp?email=$email&otp=$otp&password=$password');

    print('hello');
    print(response.statusCode);

    // Map data = jsonDecode(response.data);
    print(response.data);

    if (response.statusCode == 200) {
      final res = response.data;
      if(res["message"]=="Success" && res["status"]=="sucess"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("password changed successfully"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(10),
                          duration: Duration(seconds: 8)
                        ));
        Navigator.of(context).push(MaterialPageRoute(builder: (context){return LoginFourPage();}));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Something went wrong"),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(10),
                          duration: Duration(seconds: 8)
                        ));
      }
      // navigation(context, OtpScreen(email: email));
      //showMySnackBar(context, ' password changed', Colors.green);
    } else {
      // Handle other status codes (e.g., 401 for unauthorized)
      print('Sending Failed');
      //showMySnackBar(context, 'Sending failed', Colors.red);
    }
  } catch (e) {
    // Handle errors
    print('Error: $e');
  }
}