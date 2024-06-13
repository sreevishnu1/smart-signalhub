
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:smartsignalhub/services/forgotApi.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, this.email}) : super(key: key);
  final email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = ''; // Variable to store OTP
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // OTP TextField
            OtpTextField(
              numberOfFields: 4,
              borderColor: Color(0xFF512DA8),
              // Set to true to show as box or false to show as dash
              showFieldAsBox: true,
              // Runs when a code is typed in
              onCodeChanged: (String code) {
                // Handle validation or checks here
                otp = ''; // Store entered OTP
                setState(() {});
              },
              // Runs when every text field is filled
              onSubmit: (String verificationCode) {
                otp = verificationCode;
                setState(() {});
              },
            ),
            SizedBox(height: 20),
            // Text field for typing new password
            // TextField(
            //   controller: _passwordController,
            //   obscureText: true,
            //   decoration: InputDecoration(
            //     labelText: 'New Password',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            if (otp != '')
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'New password',
                  
                ),
              ), 
            SizedBox(height: 20),
            // Submit button
            ElevatedButton(
              onPressed: () async {
                // Handle submission here
                print('wieytdgbiu');
                await sendPassword(
                    context, widget.email, _passwordController.text, otp);
              },
              child: Text('Change password'),
            ),
          ],
        ),
      ),
    );
  }
}