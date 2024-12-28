import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/sekolah_controller.dart';
import 'package:wiscash_/page/widget/my_button.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class MySekolahBottomSheet extends StatelessWidget {
  final String nominal;

  const MySekolahBottomSheet({super.key, required this.nominal});

  @override
  Widget build(BuildContext context) {
    final sekolahController = Get.put(SekolahController());
    final int nominalInt = int.parse(nominal.replaceAll('.', ''));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: "Detail Pembayaran",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: "Nominal SPP",
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              MyText(
                text: "Rp$nominal",
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: "Biaya Transaksi",
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              MyText(
                text: "Rp0",
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          const Divider(height: 24, color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: "Total Pembayaran",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              MyText(
                text: "Rp$nominal",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: MyButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  textButton: "Ubah",
                  backgroundColor: Color(0xFFC0E1E6),
                  textColor: Color(0xFF025A5F),
                  radius: 20,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: MyButton(
                  onPressed: () {
                    sekolahController.handleSekolah(context, nominalInt);
                  },
                  textButton: "Konfirmasi",
                  backgroundColor: Color(0xFF025A5F),
                  textColor: Colors.white,
                  radius: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
