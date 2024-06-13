import 'package:flutter/material.dart';
import 'package:smartsignalhub/controllSignal.dart';
import 'package:smartsignalhub/screens/admin/adminNewHome.dart';
import 'package:smartsignalhub/screens/eMV/emvHome.dart';
import 'package:smartsignalhub/screens/eMV/emvprofile.dart';

class AdminBottomNav extends StatefulWidget {
  AdminBottomNav({super.key});

  @override
  State<AdminBottomNav> createState() => _AdminBottomNavState();
}

class _AdminBottomNavState extends State<AdminBottomNav> {
  int _currentIndex = 0;

  final _pages = [
    //EmvProfileScreen(),
    AdminNewHome(),
    ControllVehicle()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
        _pages[_currentIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value; 
          setState(() {
            
          });
          
        },
        items: [
          //BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.control_camera),label: "Traffic")
        ]),
    );
  }
}