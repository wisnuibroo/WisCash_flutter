import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/transfer_controller.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/page/widget/my_text.dart';
import 'package:wiscash_/page/widget/my_text_field.dart';
import 'package:wiscash_/page/widget/my_button.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TransferController transferController = Get.put(TransferController());
    final BalanceController balanceController = Get.put(BalanceController());

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Transfer",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF8F9FA),
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              final balance = balanceController.balance.value;
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF025A5F), Color(0xFF00B4D8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Saldo Anda",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        MyText(
                          text: "Rp $balance",
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/image/wiscash2.png',
                      width: 110,
                      height: 45,
                    ),
                  ],
                ),
              );
            }),
            SizedBox(height: 32),
            MyText(
              text: "Masukkan Nomor Tujuan",
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            SizedBox(height: 12),
            MyTextField(
              controller: transferController.recipientController,
              hintText: " ",
              prefixText: '+62 ',
              fillColor: Colors.white,
              borderRadius: 12.0,
            ),
            SizedBox(height: 24),
            MyText(
              text: "Nominal Transfer",
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            SizedBox(height: 12),
            MyTextField(
              controller: transferController.amountController,
              hintText: " ",
              prefixText: 'Rp ',
              fillColor: Colors.white,
              borderRadius: 12.0,
            ),
            Spacer(),
            Center(
              child: MyButton(
                onPressed: () {
                  transferController.handleTransfer(context);
                },
                textButton: "Konfirmasi Transfer",
                backgroundColor: Color(0xFF025A5F),
                textColor: Colors.white,
                radius: 20,
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
