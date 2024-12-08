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
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                final balance = balanceController.balance.value;
                return Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF025A5F), Color(0xFF00B4D8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText(
                        text: "Saldo Anda:    ",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      MyText(
                        text: "Rp $balance",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 24),
              const MyText(
                text: "Masukkan Nomor Tujuan",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: transferController.recipientController,
                hintText: "",
                prefixText: '+62 ',
                fillColor: Colors.white,
                borderRadius: 12.0,
              ),
              const SizedBox(height: 24),
              const MyText(
                text: "Nominal Transfer",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: transferController.amountController,
                hintText: "",
                prefixText: 'Rp ',
                fillColor: Colors.white,
                borderRadius: 12.0,
              ),
              const SizedBox(height: 24),
              SizedBox(
                child: MyButton(
                  onPressed: () {
                    transferController.handleTransfer(context);
                  },
                  textButton: "Konfirmasi Transfer",
                  backgroundColor: const Color(0xFF025A5F),
                  textColor: Colors.white,
                  radius: 10,
                  width: double.infinity,
                  height: 50,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
