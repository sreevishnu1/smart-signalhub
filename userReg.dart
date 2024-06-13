// import 'package:flutter/material.dart';
// import 'package:smartsignalhub/customeWidgets/customeTextfield.dart';

// class UserRegisterScreen extends StatelessWidget {
//   UserRegisterScreen({super.key});

//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController addressController = TextEditingController();

//   final loginformkey = GlobalKey<FormState>();
//   final ValueNotifier<bool> obsecure = ValueNotifier(true);
//   String selectedVehicleType = 'Select Vehicle type';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black12,
//         body: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: SingleChildScrollView(
//             child: Form(
//               key: loginformkey,
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Register',
//                         style: TextStyle(
//                             fontSize: 25, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       CustomeTextfield(
//                         validator: (value) {
//                           if (value.toString().isEmpty) {
//                             return 'Enter name';
//                           }
//                           return null;
//                         },
//                         controller: nameController,
//                         prefix: Icon(Icons.person),
//                         label: 'Name',
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       CustomeTextfield(
//                         validator: (value) {
//                           if (value.toString().isEmpty) {
//                             return 'Enter Email';
//                           }
//                           return null;
//                         },
//                         controller: emailController,
//                         prefix: Icon(Icons.email_outlined),
//                         label: 'Email',
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       CustomeTextfield(
//                         validator: (value) {
//                           if (value.toString().isEmpty) {
//                             return 'Enter Address';
//                           }
//                           return null;
//                         },
//                         controller: addressController,
//                         prefix: Icon(Icons.location_on),
//                         label: 'Address',
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       CustomeTextfield(
//                         validator: (value) {
//                           if (value.toString().isEmpty) {
//                             return 'Enter Phone';
//                           }
//                           return null;
//                         },
//                         controller: phoneController,
//                         prefix: Icon(Icons.phone),
//                         label: 'Phone',
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       CustomeTextfield(
//                         validator: (value) {
//                           if (value.toString().isEmpty) {
//                             return 'Enter Username';
//                           }
//                           return null;
//                         },
//                         controller: usernameController,
//                         prefix: Icon(Icons.person),
//                         label: 'Username',
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       ValueListenableBuilder(
//                         valueListenable: obsecure,
//                         builder: (context, value, child) {
//                           return Container(
//                             height: 55,
//                             child: CustomeTextfield(
//                               obsecure: obsecure.value,
//                               validator: (value) {
//                                 if (value.toString().isEmpty) {
//                                   return 'Enter password';
//                                 } else if (value.toString().length < 6) {
//                                   return 'password must be 6 digits';
//                                 }
//                                 return null;
//                               },
//                               controller: passwordController,
//                               prefix: Icon(Icons.lock),
//                               suffix: IconButton(
//                                   onPressed: () {
//                                     obsecure.value = !obsecure.value;
//                                   },
//                                   icon: obsecure.value
//                                       ? Icon(Icons.visibility_off)
//                                       : Icon(Icons.visibility)),
//                               label: 'Password',
//                             ),
//                           );
//                         },
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           if (loginformkey.currentState!.validate()) {
//                             print(usernameController.text);
//                             print(passwordController.text);
//                           }
//                         },
//                         child: Text('Register'),
//                         style: ElevatedButton.styleFrom(
//                             minimumSize: Size(200, 45)),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Alreadt have an Account'),
//                           TextButton(onPressed: () {}, child: Text('Login')),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }
