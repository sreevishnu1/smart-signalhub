import 'package:flutter/material.dart';
import 'package:smartsignalhub/constants/sizes.dart';
import 'package:smartsignalhub/screens/admin/acceptedVehicles.dart';
import 'package:smartsignalhub/screens/admin/addNotification.dart';
import 'package:smartsignalhub/screens/admin/feedbackView.dart';
import 'package:smartsignalhub/screens/admin/vehiclerequest.dart';
import 'package:smartsignalhub/services/admin/getApprovedemv.dart';
import 'package:smartsignalhub/services/admin/getEMVrequest.dart';
import 'package:smartsignalhub/services/admin/getFeedbacks.dart';
import 'package:smartsignalhub/services/admin/viewNotification.dart';

class AdminNewHome extends StatelessWidget {
  const AdminNewHome({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(border: Border.all(style: BorderStyle.none),borderRadius: BorderRadius.circular(30),color: Color.fromARGB(255, 238, 246, 238)),
        child: Column(children: [
          Row(
            children: [
              w10,
              Container(
                height: h*0.2,
                width: w*0.2,
                child: Center(child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/emv2.png"),
                  radius: 100,)),
              ),w15,
              Column(
                children: [
                  Text("Welcome",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.cyan),),
                  Text("Admin",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.cyan),),
                ],
              )
            ],
          ),
          h20,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async{
                      await viewNotificationApi();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNotificationScreen()));
                    },
                    child: Container(
                      height: h*0.2,
                      decoration: BoxDecoration(border: Border.all(style: BorderStyle.none),borderRadius: BorderRadius.circular(10),color: Color.fromARGB(255, 97, 146, 103)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Icon(Icons.notifications,color: Colors.white,size: 30,),
                        Text("Notifications",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),)
                      ],),
                    ),
                  ),
                ),
                w15,              
                Expanded(
                  child: InkWell(
                    onTap: () async{
                      await viewFeedbackApi();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeedbackViewScreen()));
                    },
                    child: Container(
                                  height: h*0.2,
                                  decoration: BoxDecoration(border: Border.all(style: BorderStyle.none),borderRadius: BorderRadius.circular(10),color: Color.fromARGB(255, 97, 146, 103)),
                                child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Icon(Icons.feedback,color: Colors.white,size: 30,),
                        Text("Feedback",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),)
                      ],),
                                ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async{
                      await emvrequestApi();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => VehicleReq()));
                    },
                    child: Container(
                      
                      height: h*0.2,
                      decoration: BoxDecoration(border: Border.all(style: BorderStyle.none),borderRadius: BorderRadius.circular(10),color: Color.fromARGB(255, 97, 146, 103)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Icon(Icons.refresh,color: Colors.white,size: 30,),
                        Text("Requests",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),)
                      ],),
                    ),
                  ),
                ),
                w15,
                
                Expanded(
                  child: InkWell(
                    onTap: () async{
                      await approvedEmvApi();
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AcceptedVehicles()));
                    },
                    child: Container(
                                  height: h*0.2,
                                  decoration: BoxDecoration(border: Border.all(style: BorderStyle.none),borderRadius: BorderRadius.circular(10),color: Color.fromARGB(255, 97, 146, 103)),
                                child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Icon(Icons.electric_car,color: Colors.white,size: 30,),
                        Text("Vehicles",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.white),)
                      ],),
                                ),
                  ),
                )
              ],
            ),
          )
        ],),
      ),
    );
  }
}