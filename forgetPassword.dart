import 'package:flutter/material.dart';
import 'package:smartsignalhub/services/forgotApi.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  TextEditingController forgotpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/cars6.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Adjust the height of the image from the top
                TextFormField(
                  controller: forgotpasswordController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await sendEmail(
                      context,
                      forgotpasswordController.text,
                    );
                  },
                  child: Text("Send OTP"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}