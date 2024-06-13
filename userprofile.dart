import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartsignalhub/constants/sizes.dart';
import 'package:smartsignalhub/screens/loginNew.dart';

class userprofile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileScreenBody();
  }
}

class ProfileScreenBody extends StatefulWidget {
  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}
class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  final ValueNotifier<bool> isFieldVisible = ValueNotifier(false);
  ValueNotifier<bool> isProfileCompleted = ValueNotifier(false);
  ValueNotifier<bool> isCompleteProfileClicked = ValueNotifier(false);
  ValueNotifier isPicked = ValueNotifier(false);
  String selectedDate = " Select DOB";
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
       // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            height: h * 0.30,
            color: Colors.blue,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Color.fromARGB(255, 118, 179, 94),
                    child: Text(
                      "S",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          notCompletedContainer(w, h)
        ],
      ),
    );
  }
  Widget notCompletedContainer(double w, double h){
    return ValueListenableBuilder(
      valueListenable: isCompleteProfileClicked,
      builder: (BuildContext context, value, Widget? child) { 
        if (isCompleteProfileClicked.value == false) {
          return Padding(
              padding: const EdgeInsets.only(left: 35, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  ProfileText(w: w, headder: 'Name', body: 'Seethal'),
                  SizedBox(height: 10),
                  ProfileText(
                      w: w, headder: 'Email', body: 'seethal@gmail.com'),
                  SizedBox(height: 10),
                  ProfileText(
                      w: w, headder: 'Teacher ID', body: '2101200964'),
                  SizedBox(height: 10),
                  ProfileText(
                      w: w, headder: 'Department', body: 'Electronics and Communnication'),
                  SizedBox(height: 10),
                  h40,
                  Center(
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginFourPage(),)),
                        child: Container(
                          
                          width: 150,height: 40,
                          decoration: BoxDecoration(border: Border.all(style: BorderStyle.none),borderRadius: BorderRadius.circular(7),color:Color.fromARGB(255, 13, 79, 101))
                          ,child: Center(child: Text("Sign Out",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white)),),)),
                    )               
                ],
              ),
            );
        }
        else{
          return Padding(
              padding: const EdgeInsets.only(left: 35, right: 35,top: 20 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      //hintText: "Phone Number",
                      label: Text("Phone Number"),
                      floatingLabelBehavior: FloatingLabelBehavior.always
                    ),
                  ),
                  h15,
                   Container(
  height: 40,
  width: w*0.83,
  decoration: BoxDecoration(
    border: Border.all(),
    borderRadius: BorderRadius.circular(10)
  ),
  child: DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue;
                });
              },
              items: <String>['male', 'female', 'other'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Select Category'),
            ),
),
                  h20,
                  InkWell(
                    onTap: () => _selectDate(context),
                    child: Container(
                      height: 40,
                      width: w*0.83,
                      decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          w5,
                          Text("Date of Birth :", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                          w10,
                          ValueListenableBuilder(                          
                            valueListenable: isPicked,
                            builder: (BuildContext context, value, Widget? child) {return Text(selectedDate); },
                            )
                        ],
                      ),
                    ),
                  ),
                  h30,
                  Center(child: ElevatedButton(onPressed: (){
                    isProfileCompleted.value = true;
                  }, child: Text("Save")))
                ],
              ),
            );
        }
        },
    );
  }

  DateTime selecteddate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selecteddate,
        firstDate: DateTime(1960, 8),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
        isPicked.value = true;
        selecteddate = picked;
        final dte = picked.toString().split(' ');
        selectedDate = dte[0];
        print(picked);
    }
  }
}

class ProfileText extends StatelessWidget {
  const ProfileText({
    Key? key,
    required this.w,
    required this.headder,
    required this.body,
  }) : super(key: key);

  final double w;
  final String headder;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: w * 0.25,
          child: Text(
            headder,
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 38, 145, 232),
            ),
          ),
        ),
        Text(
          body,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Divider(),
      ],
    );
  }
}
