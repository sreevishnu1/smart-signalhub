import 'package:flutter/material.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/constants/sizes.dart';


class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ValueListenableBuilder(valueListenable: notifications, 
        builder: (context, value, child) {
          return
          notifications.value.length<1? Center(child: Text("No notifications"),):
          ListView.builder(
          itemBuilder: (context, index) => 
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              children: [
                h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Icon(Icons.circle,size: 15,color: Color.fromARGB(255, 113, 170, 115),), w10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notifications.value[index].notification,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                          h5,
                          Text(notifications.value[index].date.toString().substring(0,10),style: TextStyle(color: Color.fromARGB(158, 33, 36, 31),fontWeight: FontWeight.w600),),
                        ],
                      )],),
                
                      IconButton(onPressed: () {
                        
                      }, icon: Icon(Icons.location_on,color: Colors.green))
                  ],
                ),
                h10,
                Padding(
                  padding: const EdgeInsets.fromLTRB(30,0,30,0),
                  child: Divider(),
                )
              ],
            ),
          ),
            itemCount: notifications.value.length,
          );
        },)
      ));
  }
}