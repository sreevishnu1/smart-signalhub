import 'package:flutter/material.dart';

class CustomeTextfield extends StatelessWidget {
  CustomeTextfield(
      {super.key,
      this.label,
      this.controller,
      this.validator,
      this.prefix,
      this.suffix, this.obsecure,this.type,this.isUpper});
  final label;
  final controller;
  final validator;
  final prefix;
  final suffix;
  final obsecure;
  bool? isUpper;
  TextInputType? type;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: tColor,),
      obscureText: obsecure ?? false,
      controller: controller,
      validator: validator,
      keyboardType: type == null? TextInputType.text : TextInputType.number,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: tColor),
          prefixIcon: prefix,
          prefixIconColor: tColor,
          suffixIconColor: tColor,
          suffix: suffix,
          label: Text(label),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: tColor),
            borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: tColor),
            borderRadius: BorderRadius.circular(10))
            ),
    );
  }
}

final tColor = Colors.white;
