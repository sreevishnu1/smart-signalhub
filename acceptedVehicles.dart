import 'package:flutter/material.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/screens/admin/vehicleFulldetails.dart';

class AcceptedVehicles extends StatelessWidget {
  const AcceptedVehicles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 246, 237),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(itemBuilder: (context, index) {
          final emv = approvedEmv.value[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => VehicleFullDetails(emv: emv, isReg: true),));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(style: BorderStyle.none),
                borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.electric_car),
                ),
                title: Text(emv.organisationName),
                subtitle: Text(emv.vehicleRegnum),
                trailing: Icon(Icons.arrow_right),
                ),
            ),
          );
        }, separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount: approvedEmv.value.length),
      ),
    );
  }
}