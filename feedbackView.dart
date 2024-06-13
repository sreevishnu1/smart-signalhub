import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/constants/sizes.dart';

class FeedbackViewScreen extends StatelessWidget {
  const FeedbackViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              h10,
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 15,
                        color: Color.fromARGB(255, 113, 170, 115),
                      ),
                      w10,
                      Container(
                        width: MediaQuery.of(context).size.width*0.85,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             
                             Text(feedbacks.value[index].feedback,
                              
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600)),
                            
                            h5,
                            Text(
                              feedbacks.value[index].date,
                              style: TextStyle(
                                fontSize: 10,
                                  color: Color.fromARGB(158, 33, 36, 31),
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  
                ],
              ),
              h10,
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Divider(),
              )
            ],
          ),
        ),
        itemCount: feedbacks.value.length,
      ),
    ));
  }
}
