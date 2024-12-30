import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/bpjs_kesehatan_controller.dart';
import 'package:wiscash_/page/widget/my_button.dart';
import 'package:wiscash_/page/widget/my_text.dart';
import 'package:wiscash_/page/widget/my_text_field.dart';

class BpjsKesehatanPage extends StatelessWidget {
  const BpjsKesehatanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BpjsKesehatanController bpjsKesehatanController =
        Get.put(BpjsKesehatanController());

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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            ListTile(
              leading: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/BPJS_Kesehatan_logo.svg/2560px-BPJS_Kesehatan_logo.svg.png',
                width: 40,
                height: 40,
              ),
              title: MyText(
                text: "BPJS Kesehatan",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            MyText(
              text: "Nomor Kartu",
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            SizedBox(height: 4),
            MyTextField(
              controller: bpjsKesehatanController.nomorKartuController,
              hintText: 'Contoh 1234567890',
              fillColor: Colors.white,
              borderRadius: 12.0,
            ),
            SizedBox(height: 25),
            MyText(
              text: "Nominal",
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            SizedBox(height: 4),
            MyTextField(
              controller: bpjsKesehatanController.amountController,
              hintText: 'Masukkan Nominal',
              prefixText: "Rp ",
              fillColor: Colors.white,
              borderRadius: 12.0,
            ),
            SizedBox(height: 25),
            MyText(
              text: "Nomor Terakhir",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: 10),
            Obx(() {
              if (bpjsKesehatanController.nomorTerakhir.isEmpty) {
                return Row(
                  children: [
                    Image.network(
                      'https://static.vecteezy.com/system/resources/thumbnails/024/952/617/small_2x/invoice-bill-receipt-png.png',
                      width: 50,
                      height: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Belum ada nomor terakhir",
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        MyText(
                          text: "Transaksi dulu biar ada nomor kamu di sini",
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return MyText(
                  text: bpjsKesehatanController.nomorTerakhir.value,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                );
              }
            }),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: MyButton(
                onPressed: () {
                  bpjsKesehatanController.handleBPJSKesehatan(context);
                },
                textButton: "Bayar",
                backgroundColor: const Color(0xFF025A5F),
                textColor: Colors.white,
                radius: 15,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
