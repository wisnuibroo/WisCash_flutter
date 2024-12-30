import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/airpdam_controller.dart';
import 'package:wiscash_/page/widget/my_button.dart';

import 'package:wiscash_/page/widget/my_text.dart';
import 'package:wiscash_/page/widget/my_text_field.dart';

class AirpdamPage extends StatelessWidget {
  const AirpdamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AirpdamController airpdamController = Get.put(AirpdamController());

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Air PDAM",
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
                'https://smart.sdsi.co.id/wp-content/uploads/sites/5/2023/01/LOGO-PDAM-copy.png',
                width: 40,
                height: 40,
              ),
              title: MyText(
                text: "PDAM",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            Obx(() {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: MyText(
                    text: "Pilih lokasi",
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                  value: airpdamController.selectedLokasi.value.isEmpty
                      ? null
                      : airpdamController.selectedLokasi.value,
                  onChanged: (String? value) {
                    airpdamController.selectedLokasi.value = value ?? "";
                  },
                  items: airpdamController.lokasi.map((String lokasi) {
                    return DropdownMenuItem<String>(
                      value: lokasi,
                      child: MyText(
                        text: lokasi,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
            SizedBox(height: 25),
            MyText(
              text: "Nomor Pelanggan",
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            SizedBox(height: 4),
            MyTextField(
              controller: airpdamController.nomorPelangganController,
              hintText: ' ',
              fillColor: Colors.white,
              borderRadius: 12.0,
            ),
            SizedBox(height: 16),
            MyText(
              text: "Nominal",
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            SizedBox(height: 4),
            MyTextField(
              controller: airpdamController.amountController,
              hintText: " ",
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
              if (airpdamController.nomorTerakhir.isEmpty) {
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
                  text: airpdamController.nomorTerakhir.value,
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
                  airpdamController.handleAirPDAM(context);
                },
                textButton: "Bayar Tagihan PDAM",
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
