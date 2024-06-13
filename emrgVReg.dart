import 'package:flutter/material.dart';
import 'package:smartsignalhub/Domain/emergency/emv.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/customeWidgets/customeTextfield.dart';
import 'package:smartsignalhub/screens/loginNew.dart';
import 'package:smartsignalhub/services/emv/emergencyRedApi.dart';

class EmergencyVehicleRegister extends StatelessWidget {
  EmergencyVehicleRegister({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController driverNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController orgNameController = TextEditingController();
  TextEditingController vehiclenoController = TextEditingController();
  final loginformkey = GlobalKey<FormState>();
  final ValueNotifier<bool> obsecure = ValueNotifier(true);
  final ValueNotifier<String> selectedVehicleType = ValueNotifier('Select Vehicle type');
  final tColor = Colors.white;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        backgroundColor: Colors.black12,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15.0,30,15,15),
          child: SingleChildScrollView(
            child: Form(
              key: loginformkey,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/emv2.png")),
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'EMV REGISTER',
                        style: TextStyle(
                          color: tColor,
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomeTextfield(
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Enter Drivername';
                          }
                          else if(value.length <3){
                            return "Name must have min 3 character";
                          }
                          else if(isValidName(value)== false){
                            return "Name can only have characters";
                          }
                          return null;
                        },
                        controller: driverNameController,
                        prefix: Icon(Icons.person),
                        label: 'Driver Name',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomeTextfield(
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Enter Email';
                          }
                          else if(isValidEmail(value) == false){
                            return 'Invalid email format';
                          }
                          return null;
                        },
                        controller: emailController,
                        prefix: Icon(Icons.email_outlined),
                        label: 'Email',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomeTextfield(
                        type: TextInputType.number,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Enter Phone';
                          }
                          
                          return null;
                        },
                        controller: phoneController,
                        prefix: Icon(Icons.phone),
                        label: 'Phone',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //dropdown
                      ValueListenableBuilder(valueListenable: selectedVehicleType, builder: (context, value, child) {
                        return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.white,
                            border: Border.all(color: tColor),
                            borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            underline: SizedBox(),
                            // Define the value
                            value: selectedVehicleType.value,

                            // Define the items in the dropdown
                            items: <String>[
                              'Select Vehicle type',
                              'Ambulance',
                              'VIP',
                              'VVIP'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(color: Colors.black),),
                              );
                            }).toList(),

                            // Define the onChanged callback
                            onChanged: (newValue) {
                              selectedVehicleType.value = newValue!;

                              print('Selected: $newValue');
                            },
                          ),
                        ),
                      );
                      },),
                      SizedBox(
                        height: 5,
                      ),
                      CustomeTextfield(
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Enter organisation Name';
                          }
                          return null;
                        },
                        controller: orgNameController,
                        prefix: Icon(Icons.house_outlined),
                        label: 'Organisation Name',
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      CustomeTextfield(
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Enter vehicle No';
                          }
                          else if(isValidVehicleNumber(value) == false){
                            return 'Invalid vehicle number';
                          }
                          return null;
                        },
                        controller: vehiclenoController,
                        prefix: Icon(Icons.directions_car_filled_outlined),
                        label: 'Vehicle No',
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      CustomeTextfield(
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Enter Licence number';
                          }
                          else if(isValidCustomFormat(value)== false){
                            return "Inavlid licence number";
                          }
                          return null;
                        },
                        controller: usernameController,
                        prefix: Icon(Icons.person),
                        label: 'Licence number',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ValueListenableBuilder(
                        valueListenable: obsecure,
                        builder: (context, value, child) {
                          return Container(
                            height: 55,
                            child: CustomeTextfield(
                              obsecure: obsecure.value,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return 'Enter password';
                                } else if (value.toString().length < 8) {
                                  return 'password must be 8 digits';
                                }
                                return null;
                              },
                              controller: passwordController,
                              prefix: Icon(Icons.lock),
                              suffix: IconButton(
                                  onPressed: () {
                                    obsecure.value = !obsecure.value;
                                  },
                                  icon: obsecure.value
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility)),
                              label: 'Password',
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (loginformkey.currentState!.validate()) {
                            // print(usernameController.text);
                            // print(passwordController.text);
                            _signInClick(context);
                          }
                        },
                        child: Text('Register'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(200, 45)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  
  //signin clicke
  void _signInClick(BuildContext context) async{
    EmergencyRegModel user = EmergencyRegModel(Username: driverNameController.text, Email: emailController.text, Password: passwordController.text,Phone: phoneController.text, Organizationname: orgNameController.text, Vehicleregnumber: vehiclenoController.text,liscencenumber: usernameController.text,Vehicletype: selectedVehicleType.value);
    final res = await emergencyRegApi(user);
    print(res);
    if (res == "success") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Apllication submitted successfully"),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(10),
                duration: Duration(seconds: 8)));

                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginFourPage(),));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("something went wrong"),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(10),
                duration: Duration(seconds: 8)));
    }

  }

}
