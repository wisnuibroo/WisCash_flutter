import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/buat_impian_controller.dart';
import 'package:wiscash_/page/home/buat_impian_page.dart';
import 'package:wiscash_/page/widget/my_button.dart';
import 'package:wiscash_/page/widget/my_help_card.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class NabungPage extends StatelessWidget {
  final BuatImpianController buatImpianController =
      Get.put(BuatImpianController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: "WisGoals",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              IconButton(
                icon: const Icon(Icons.help_outline),
                onPressed: () {
                  MyHelpCard.show(context); 
                },
                color: Colors.black,
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
      ),
      body: Obx(() {
        if (buatImpianController.listImpian.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: buatImpianController.listImpian.length,
                  itemBuilder: (context, index) {
                    final impian = buatImpianController.listImpian[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: ListTile(
                        leading: Icon(Icons.hourglass_empty_outlined,
                            color: Color(0xFF025A5F)),
                        title: MyText(
                          text: impian['nama'] ?? '',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        subtitle: MyText(
                          text: 'Target: Rp ${impian['target']}',
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: MyButton(
                  onPressed: () {
                    Get.to(
                      () => BuatImpianPage(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 350),
                    );
                  },
                  textButton: 'Buat Impian Baru',
                  textColor: Colors.white,
                  backgroundColor: Color(0xFF025A5F),
                  radius: 15,
                  width: double.infinity,
                  height: 50,
                ),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: Image.network(
                  'https://bankalbarokah.id/public/assets/images/hero-tabungan.png',
                  height: 200,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 150,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: MyText(
                    text: 'Semua impian bakal jadi kenyataan',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: MyText(
                    text:
                        'Dari liburan sampai belanja gadget idaman, atur dan wujudkan semuanya dengan WisGoals!',
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Spacer(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: MyButton(
                  onPressed: () {
                    Get.to(
                      () => BuatImpianPage(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 350),
                    );
                  },
                  textButton: 'Buat Impian',
                  textColor: Colors.white,
                  backgroundColor: Color(0xFF025A5F),
                  radius: 15,
                  width: double.infinity,
                  height: 50,
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
