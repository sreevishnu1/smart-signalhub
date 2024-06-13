import 'package:flutter/material.dart';
import 'package:smartsignalhub/controllSignal.dart';
import 'package:smartsignalhub/screens/eMV/emvHome.dart';
import 'package:smartsignalhub/screens/eMV/emvprofile.dart';

class EmergencyBpttomNav extends StatefulWidget {
  EmergencyBpttomNav({super.key});

  @override
  State<EmergencyBpttomNav> createState() => _EmergencyBpttomNavState();
}

class _EmergencyBpttomNavState extends State<EmergencyBpttomNav> {
  int _currentIndex = 0;

  final _pages = [
    EmvProfileScreen(),
    emhome(),
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
        items: [BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.control_camera),label: "Traffic")
        ]),
    );
  }
}