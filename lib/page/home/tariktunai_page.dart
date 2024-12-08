import 'package:flutter/material.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class TariktunaiPage extends StatelessWidget {
  const TariktunaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Tarik Tunai",
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
            SizedBox(height: 30),
            MyText(
              text: "   Metode Penarikan",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/image/bca-logo.png',
                      width: 30,
                      height: 30,
                    ),
                    title: MyText(
                      text: "ATM BCA",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    subtitle: MyText(
                      text: "Biaya admin Rp5.000",
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                    // onTap: () {
                    //   // Handle tap action
                    // },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/image/bri-logo.png',
                      width: 30,
                      height: 30,
                    ),
                    title: MyText(
                      text: "ATM BRI",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    subtitle: MyText(
                      text: "Biaya admin Rp5.000",
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                    // onTap: () {
                    //   // Handle tap action
                    // },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/image/indomaret-logo.png',
                      width: 30,
                      height: 30,
                    ),
                    title: MyText(
                      text: "Indomaret",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    subtitle: MyText(
                      text: "Biaya admin Rp3.000",
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                    // onTap: () {
                    //   // Handle tap action
                    // },
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
