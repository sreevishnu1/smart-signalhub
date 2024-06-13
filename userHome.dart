import 'package:flutter/material.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/customeWidgets/CustomeContainer.dart';
import 'package:smartsignalhub/screens/eMV/notification.dart';
import 'package:smartsignalhub/screens/eMV/newfeedback.dart';
import 'package:smartsignalhub/services/admin/getFeedbacks.dart';
import 'package:smartsignalhub/services/admin/viewNotification.dart';
import 'package:smartsignalhub/services/emv/viewFeedbacks.dart';

class Userhome extends StatelessWidget {
  const Userhome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USER'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/grr.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [      
                InkWell(
                  onTap: () async{ 
                    feedbacks.value.clear();
                    await viewuserFeedbackApi();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Feedbackscreen(),));},
                  child: CustomeContainer(
                    text: 'sent Feedback',
                    icon: Icon(
                      Icons.feedback,
                      color: Colors.white,
                    ), 
                    color: Colors.green,
                  ),
                ),
                InkWell(
                  onTap: () async{
                    await viewNotificationApi();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notifications(),));},
                  child: CustomeContainer(
                    text: " notifications",
                    icon: Icon(Icons.notification_add,color:Colors.white,), 
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 
