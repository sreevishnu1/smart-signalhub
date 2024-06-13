
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartsignalhub/customeWidgets/CustomeContainer.dart';
import 'package:smartsignalhub/screens/admin/addNotification.dart';
import 'package:smartsignalhub/screens/eMV/notification.dart';
import 'package:smartsignalhub/screens/eMV/newfeedback.dart';
import 'package:smartsignalhub/services/admin/getFeedbacks.dart';
import 'package:smartsignalhub/services/admin/viewNotification.dart';


class emhome extends StatelessWidget {
  const emhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Emergency vehicle'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/emv2.png'),fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Feedbackscreen())),
                    child: CustomeContainer(
                    
                      text: 'sent Feedback',
                      icon: Icon(
                        Icons.feedback,
                        color: Colors.white,
                      ), color: Colors.green,
                    ),
                  ),
                  InkWell(
                    onTap: () async{
                      await viewNotificationApi();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                    },
                    child: CustomeContainer(
                      text: "notifications",
                      icon: Icon(Icons.notification_add,color:Colors.white,), color: Colors.blue,
                      
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
