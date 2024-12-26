import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/page/home/tagihan_listrik_page.dart';
import 'package:wiscash_/page/home/token_listrik_page.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class PlnPage extends StatelessWidget {
  const PlnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "PLN",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/9/97/Logo_PLN.png',
                      width: 30,
                      height: 30,
                    ),
                    title: MyText(
                      text: "Token Listrik",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    trailing:
                        const Icon(Icons.chevron_right, color: Colors.black),
                    onTap: () {
                      Get.to(
                        () => TokenListrikPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/9/97/Logo_PLN.png',
                      width: 30,
                      height: 30,
                    ),
                    title: MyText(
                      text: "Tagihan Listrik",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    trailing:
                        const Icon(Icons.chevron_right, color: Colors.black),
                    onTap: () {
                      Get.to(
                        () => TagihanListrikPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
