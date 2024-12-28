import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/telkom_controller.dart';
import 'package:wiscash_/page/widget/my_button.dart';
import 'package:wiscash_/page/widget/my_text.dart';
import 'package:wiscash_/page/widget/my_text_field.dart';

class TelkomPage extends StatelessWidget {
  const TelkomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TelkomController telkomIndihomeController =
        Get.put(TelkomController());

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Telkom",
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
                'https://static.republika.co.id/uploads/images/inpicture_slide/indihome-_190508132900-535.png',
                width: 40,
                height: 40,
              ),
              title: MyText(
                text: "Telkom Indihome",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            MyText(
              text: "Nomor Pelanggan",
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            SizedBox(height: 4),
            MyTextField(
              controller: telkomIndihomeController.nomorPelangganController,
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
              controller: telkomIndihomeController.amountController,
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
              if (telkomIndihomeController.nomorTerakhir.isEmpty) {
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
                  text: telkomIndihomeController.nomorTerakhir.value,
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
                  telkomIndihomeController.handleTokenListrik(context);
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