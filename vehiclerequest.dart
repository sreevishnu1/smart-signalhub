import 'package:flutter/material.dart';
import 'package:smartsignalhub/constants/globalVar.dart';
import 'package:smartsignalhub/screens/admin/vehicleFulldetails.dart';

class VehicleReq extends StatelessWidget {
  const VehicleReq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 246, 237),
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: emvrequests,
        builder: (BuildContext context, value, Widget? child) { 
          return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(itemBuilder: (context, index) {
            final emv = emvrequests.value[index];
            return InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => VehicleFullDetails(emv: emv ,isReg: false,),)) ,
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
          }, separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount: emvrequests.value.length),
        );
         },
        
      ),
    );
  }
}