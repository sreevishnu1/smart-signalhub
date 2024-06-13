
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/constants/sizes.dart';
import 'package:smartsignalhub/screens/loginNew.dart';

class EmvProfileScreen extends StatelessWidget {
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
    final pro = emvprofile[0];
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
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
                      pro.name.substring(0,1).toUpperCase(),
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextFormField(
                controller: TextEditingController(text: pro.name),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Driver Name"  
                ),),h5,
                TextFormField(
                controller: TextEditingController(text: pro.email),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email"  
                ),),h5,
                TextFormField(
                controller: TextEditingController(text: pro.phone.toString()),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: "Phone"  
                ),),h5,
                TextFormField(
                controller: TextEditingController(text: pro.organisationName),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  labelText: "Organisation Name"  
                ),),h5,
                TextFormField(
                controller: TextEditingController(text: pro.vehicleType),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.electric_car),
                  labelText: "Vehicle type"  
                ),),h5,
                TextFormField(
                controller: TextEditingController(text: pro.vehicleRegnum),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Vehicle Number"  
                ),),h5,
                
                ],
                ),
              ),
            ),
          ),
          //notCompletedContainer(w, h)
        ],
      ),
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
