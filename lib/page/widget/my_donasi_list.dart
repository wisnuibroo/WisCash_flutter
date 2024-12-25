import 'package:flutter/material.dart';

class MyDonasiList extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onPressed;

  const MyDonasiList(
      {super.key, 
      required this.imageUrl, 
      required this.title, 
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image.network(
          imageUrl,
          width: 30,
          height: 30,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, size: 30),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.black),
        onTap: onPressed);
  }
}
