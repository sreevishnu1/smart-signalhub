import 'package:flutter/material.dart';

class CustomeContainer extends StatelessWidget {
  const CustomeContainer({super.key, this.icon, this.text, required MaterialColor color});
  final icon;
  final text;
  @override
  Widget build(BuildContext context) {
    var mediaqry = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 5))
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      height: mediaqry.height / 4,
      width: mediaqry.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
