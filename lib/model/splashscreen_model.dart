import 'package:flutter/material.dart';

class SplashscreenModel extends StatelessWidget {
  final String? text, image;

  const SplashscreenModel({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        const Text(
          "WISCASH",
          style: TextStyle(
            fontSize: 32,
            color: Color(0xFF025A5F),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.network(
          image!,
          fit: BoxFit.contain,
          height: 265,
          width: 235,
        ),
      ],
    );
  }
}
