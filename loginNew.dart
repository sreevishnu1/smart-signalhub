import 'package:flutter/material.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/screens/admin/adminBottom.dart';
import 'package:smartsignalhub/screens/eMV/emergencyBottom.dart';
import 'package:smartsignalhub/screens/forgetPassword.dart';
import 'package:smartsignalhub/screens/signuppage.dart';
import 'package:smartsignalhub/screens/user/userHome.dart';
import 'package:smartsignalhub/services/loginApi.dart';

class LoginFourPage extends StatelessWidget {
  static const String path = "lib/src/pages/login/login4.dart";
  
  TextEditingController unamecontroller = TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();

  final _formKey = GlobalKey<FormState>();

  LoginFourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/car1.png'),fit: BoxFit.fill)),// Fit the image covering the whole container
              ),
          Container(
            //color:Color.fromARGB(255, 117, 76, 175).withOpacity(0.7),
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const SizedBox(
                    height: 100.0,
                  ),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 28.0),
                  ),
                  const Text(
                    "Sign in to continue",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == "" ||value!.isEmpty) {
                        return "field cant be empty";
                      }
                      else if(isValidEmail(value)==false){
                        return "Invalid email format";
                      }
                    },
                    controller: unamecontroller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54)
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == "" ||value!.isEmpty) {
                        return "field cant be empty";
                      }
                      else if(value.length <8){
                        return "password must have min 8 char";
                      }
                    },
                    controller: passwordcontroller,
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54)
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      child: Text("Sign In".toUpperCase()),
                      onPressed: () async {
                       if (_formKey.currentState!.validate()) {
                          final res = await loginApi(unamecontroller.text, passwordcontroller.text);
                        if (res == "user") {
                          Navigator.of(context).popUntil((route) => true);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Userhome(),));
                        }
                        if (res == "emergency") {
                          Navigator.of(context).popUntil((route) => true);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EmergencyBpttomNav(),));
                        }
                        if (res == "admin") {
                          Navigator.of(context).popUntil((route) => true);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminBottomNav(),));
                        }
                        if (res == "pending") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Waiting for approval"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(10),
                            duration: Duration(seconds: 8)
                          ));
                        }
                        else if(res == null || res =="failed"){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("You are not a registered user"),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(10),
                            duration: Duration(seconds: 8)
                          ));
                        }
                       }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Dont have an account?",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      const SizedBox(
                        // width: 10.0,
                        height:40,
                      ),
                      GestureDetector(
                        onTap: () {
                          
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => signupPage(),));
                        },
                        child: const Text(
                          "   Register",
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPassword(),));
                      },
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
