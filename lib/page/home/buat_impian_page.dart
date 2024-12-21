import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/buat_impian_controller.dart';
import 'package:wiscash_/page/widget/my_button.dart';
import 'package:wiscash_/page/widget/my_text.dart';
import 'package:wiscash_/page/widget/my_text_field.dart';

class BuatImpianPage extends StatelessWidget {
  const BuatImpianPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BuatImpianController buatImpianController =
        Get.put(BuatImpianController());

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Buat Impian Baru",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://cdni.iconscout.com/illustration/premium/thumb/wallet-illustration-download-in-svg-png-gif-file-formats--digital-banking-service-cash-balance-business-analytics-finance-pack-illustrations-4772022.png?f=webp', 
              height: 200,
              width: double.infinity,
            ),
            const SizedBox(height: 24),
            MyText(
              text: "Nama Impian",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            const SizedBox(height: 8),
            MyTextField(
              controller: buatImpianController.namaImpianController.value,
              hintText: 'Tulis impianmu di sini',
              fillColor: Colors.white,
              borderRadius: 12.0,
            ),
            const SizedBox(height: 24),
            MyText(
              text: "Jumlah Target",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            const SizedBox(height: 8),
            MyTextField(
              controller: buatImpianController.jumlahTargetController.value,
              hintText: 'Tulis jumlah target di sini',
              prefixText: "Rp ",
              fillColor: Colors.white,
              borderRadius: 12.0,
            ),
            const SizedBox(height: 24),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: MyButton(
                onPressed: () {
                  buatImpianController.submitForm();
                },
                textButton: "Buat Impian Baru",
                backgroundColor: Color(0xFF025A5F),
                textColor: Colors.white,
                radius: 15,
                width: double.infinity,
                height: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
