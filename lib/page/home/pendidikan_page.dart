import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/page/home/perguruan_tinggi_page.dart';
import 'package:wiscash_/page/home/sekolah_page.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class PendidikanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Pendidikan",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF8F9FA),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Color(0xFFF8F9FA),
      body: ListView(
        children: [
          SizedBox(height: 40),
          MyText(
            text: "    Pilih Biaya",
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(height: 30),
          Divider(height: 1, color: Colors.grey[300]),
          ListTile(
            title: MyText(
                text: "Sekolah",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Get.to(
                () => SekolahPage(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 350),
              );
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
          ListTile(
            title: MyText(
                text: "Perguruan Tinggi",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Get.to(
                () => PerguruanTinggiPage(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 350),
              );
            },
          ),
          Divider(height: 1, color: Colors.grey[300]),
        ],
      ),
    );
  }
}
