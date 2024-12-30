import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/page/home/bpjs_kesehatan_page.dart';
import 'package:wiscash_/page/home/bpjs_ketenagakerjaan_page.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class BpjsPage extends StatelessWidget {
  const BpjsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "BPJS",
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
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/BPJS_Kesehatan_logo.svg/2560px-BPJS_Kesehatan_logo.svg.png',
                      width: 30,
                      height: 30,
                    ),
                    title: MyText(
                      text: "BPJS Kesehatan",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    trailing:
                        const Icon(Icons.chevron_right, color: Colors.black),
                    onTap: () {
                      Get.to(
                        () => BpjsKesehatanPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.network(
                      'https://s0.bukalapak.com/uploads/content_attachment/5573393c20e8d762a82427c5/original/BPJS_Ketenagakerjaan_vector_logo.png.webp',
                      width: 30,
                      height: 30,
                    ),
                    title: MyText(
                      text: "BPJS Ketenagakerjaan",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    trailing:
                        const Icon(Icons.chevron_right, color: Colors.black),
                    onTap: () {
                      Get.to(
                        () => BpjsKetenagakerjaanPage(),
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
