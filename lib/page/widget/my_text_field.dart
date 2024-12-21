import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController ?controller;
  final String hintText;
  final String prefixText;
  final Color fillColor;
  final double borderRadius;

  const MyTextField({
    Key? key,
     this.controller,
    this.hintText = '',
    this.prefixText = '',
    this.fillColor = Colors.white,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        prefixText: prefixText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        filled: true,
        fillColor: fillColor,
      ),
    );
  }
}
