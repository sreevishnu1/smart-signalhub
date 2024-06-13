import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/constants/sizes.dart';
import 'package:smartsignalhub/services/admin/getFeedbacks.dart';
import 'package:smartsignalhub/services/emv/sentFeedback.dart';
import 'package:smartsignalhub/services/emv/viewFeedbacks.dart';

class Feedbackscreen extends StatefulWidget {
  Feedbackscreen({super.key});

  @override
  State<Feedbackscreen> createState() => _FeedbackscreenState();
}

class _FeedbackscreenState extends State<Feedbackscreen> {
  final feedbackController = TextEditingController();

  @override
  void initState() {
    //getComplaints();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 185, 189, 189),
        automaticallyImplyLeading: true,
        title: Text(
          "feedbacks",
          style: TextStyle(
              fontSize: 21,
              color: Color.fromARGB(255, 4, 57, 107),
              fontWeight: FontWeight.w800),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            //height: h!*0.2,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 20, 80, 129),
                            width: 2),
                        borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 3),
                          child: TextFormField(
                            controller: feedbackController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type feedback"),
                            maxLines: 3,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 7, 6),
                              child: InkWell(
                                onTap: () async {
                                  // await viewuserFeedbackApi();
                                  final res = await sentFeedbackApi(
                                      feedbackController.text);
                                  if (res == true) {
                                    feedbackController.clear();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Feedback has been added"),
                                            backgroundColor: Colors.green,
                                            behavior: SnackBarBehavior.floating,
                                            margin: EdgeInsets.all(10),
                                            duration: Duration(seconds: 8)));
                                    
                                    await viewuserFeedbackApi();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Oops! Something went wrong"),
                                            backgroundColor: Colors.red,
                                            behavior: SnackBarBehavior.floating,
                                            margin: EdgeInsets.all(10),
                                            duration: Duration(seconds: 8)));
                                  }

                                  //print(complaintList.value);
                                  // addComplaint(context);
                                },
                                child: CircleAvatar(
                                  child: Center(
                                    child: Icon(Icons.send),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                h15,

                // Return ListView if there are complaints
                ValueListenableBuilder(
                  valueListenable: feedbacks,
                  builder: (BuildContext context, value, Widget? child) {
                    return feedbacks.value.length < 1
                        ? Center(
                            child: Text("No feedbacks"),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: feedbacks.value.length,
                            itemBuilder: (context, index) {
                              //final complaint = complaintList.value[index];
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Icon(
                                            Icons.person,
                                            size: 20,
                                            color: const Color.fromARGB(
                                                255, 20, 80, 129),
                                          )),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("@user",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 11)),
                                                Text(feedbacks
                                                    .value[index].feedback),
                                                SizedBox(height: 5),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider()
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                  },
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
