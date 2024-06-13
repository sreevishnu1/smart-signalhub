import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/screens/loginNew.dart';
import 'package:smartsignalhub/services/user/userRegapi.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/cars5.jpg"))),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 50,),
                Text('USER REGISTRATION',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white),),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == "") {
                      return "field cant be empty";
                    }
                  },
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Colors.white, // Change the text color here
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Change the input text color here
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == "") {
                      return "field cant be empty";
                    }
                    else if(isValidEmail(value)==false){
                      return "Invalid email format";
                    }
                  },
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.white, // Change the text color here
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Change the input text color here
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == "") {
                      return "field cant be empty";
                    }
                    else if(value!.length <8){
                      return "Password must contain min 8 characters";
                    }
                  },
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.white, // Change the text color here
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Change the input text color here
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == "") {
                      return "field cant be empty";
                    }
                    else if(value!.length <8){
                      return "Password must contain min 8 characters";
                    }
                    else if(_passwordController.text != _confirmpasswordController.text){
                      return "Password doesn't match";
                    }
                  },
                  controller: _confirmpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(
                      color: Colors.white, // Change the text color here
                    ),
                  ),
                  style: TextStyle(color: Colors.white), // Change the input text color here
                ),
                
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () async{
                    if (_formKey.currentState!.validate()) {
                      // Implement your registration logic here
                      String username = _usernameController.text;
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      String confirmpassword = _confirmpasswordController.text;
              
                      // For now, let's just print the values
                      print('Username: $username');
                      print('Email: $email');
                      print('Password: $password');
                      print('confirmPassword: $confirmpassword');
              
                      final res = await userRegApi(username, email, password);
                      if (res == "success") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Registration completed successfully"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(10),
                          duration: Duration(seconds: 8)
                        ));
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginFourPage(),));
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
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
