// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:smartsignalhub/customeWidgets/CustomeContainer.dart';
// import 'package:smartsignalhub/screens/eMV/notification.dart';
// import 'package:smartsignalhub/screens/user/userprofile.dart';
// import 'package:smartsignalhub/services/admin/viewNotification.dart';


// class newUserhome extends StatelessWidget {
//   const newUserhome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [IconButton(onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>userprofile()));
//         }, icon: Icon(Icons.person))],
//         title: Text('USER'),
//         centerTitle: true,
//       ),
//       body: Container(
//         decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/traffic.jpeg'),fit: BoxFit.fill)),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
             
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                
//                 children: [                  
                  
//                   CustomeContainer(                 
//                     text: 'sent Feedback',
//                     icon: Icon(
//                       Icons.feedback,
//                       color: Colors.white,
//                     ), color: Colors.green,
//                   ),
//                   InkWell(
//                     onTap: () async{
//                       await viewNotificationApi();
//                       //Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
//                     },
//                     child: CustomeContainer(
//                       text: "view notification",
//                       icon: Icon(Icons.notification_add,color:Colors.white,), color: Colors.blue,
                      
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
