import 'package:flutter/material.dart';
import 'package:smartsignalhub/Domain/admin/emvReqModel.dart';
import 'package:smartsignalhub/constants/sizes.dart';
import 'package:smartsignalhub/services/admin/approvereq.dart';
import 'package:smartsignalhub/services/admin/getEMVrequest.dart';
import 'package:smartsignalhub/services/admin/rejectEmvreq.dart';

class VehicleFullDetails extends StatelessWidget {
  final bool isReg;
  final EmvReqModel emv;
  const VehicleFullDetails({super.key, required this.emv,required this.isReg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 248, 239),
      appBar: AppBar(
        title: const Text('VehicleDetails'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextFormField(
                controller: TextEditingController(text: emv.name),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Driver Name"  
                ),),h5,
                TextFormField(
                controller: TextEditingController(text: emv.email),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: "Email"  
                ),),h5,
                TextFormField(
                controller: TextEditingController(text: emv.phone.toString()),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: "Phone"  
                ),),h5,
                TextFormField(
                controller: TextEditingController(text: emv.organisationName),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  labelText: "Organisation Name"  
                ),),h5,
                TextFormField(
                controller: TextEditingController(text: emv.vehicleType),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.electric_car),
                  labelText: "Vehicle type"  
                ),),h5,
                TextFormField(
                controller: TextEditingController(text: emv.vehicleRegnum),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Vehicle Number"  
                ),),h5,
                
                ],
                ),
              ),
            ),
          ),
          h20,
          isReg?
          SizedBox():
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0,15,0),
            child: Row(
              children: [
                Expanded(child: InkWell(
                  onTap: () async{
                    final res = await approveEmvApi(emv.loginid.toString());
                    if (res == true) {
                      await emvrequestApi();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Reg request has been approved successfully"),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(10),
                duration: Duration(seconds: 8)));
                Navigator.pop(context);
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Oops! something went wrong"),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(10),
                duration: Duration(seconds: 8)));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration( color: Colors.green,border: Border.all(style: BorderStyle.none),borderRadius: BorderRadius.only(topLeft: Radius.circular(7),bottomLeft:Radius.circular(7) ))
                    ,height: 35,child: Center(child: Text("Approve",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)),),
                )),
                Expanded(child: InkWell(
                  onTap: () async{
                      final res = await rejectEmvApi(emv.loginid.toString());
                    if (res == true) {
                      await emvrequestApi();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Reg request has been rejected successfully"),
                backgroundColor: Color.fromARGB(255, 175, 76, 76),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(10),
                duration: Duration(seconds: 8)));
                Navigator.pop(context);
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Oops! something went wrong"),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(10),
                duration: Duration(seconds: 8)));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration( color: Color.fromARGB(255, 138, 50, 44),border: Border.all(style: BorderStyle.none),borderRadius: BorderRadius.only(topRight: Radius.circular(7),bottomRight:Radius.circular(7) )),
                    height: 35,child: Center(child: Text("Reject",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)),),
                ))
              ],
            ),
          )
        ],
      )
    );
  }
}