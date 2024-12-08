import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/topup_controller.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';

import 'package:wiscash_/page/widget/my_button.dart';
import 'package:wiscash_/page/widget/my_text.dart';
import 'package:wiscash_/page/widget/my_text_field.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TopupController topupController = Get.put(TopupController());

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Top Up",
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
                final balance = Get.find<BalanceController>().balance.value;
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
                text: "Masukkan Nominal",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: topupController.amountController,
                hintText: '',
                prefixText: 'Rp ',
                fillColor: Colors.white,
                borderRadius: 12.0,
              ),
              const SizedBox(height: 24),
              const MyText(
                text: "Pilih Metode Top Up",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              const SizedBox(height: 8),
              Column(
                children: topupController.topUpMethods.keys.map((method) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.account_balance_wallet,
                            color: const Color(0xFF025A5F)),
                        title: Text(
                          method,
                          style: const TextStyle(
                              fontFamily: 'Poppins', fontSize: 14),
                        ),
                        trailing: Obx(() {
                          return Icon(
                            topupController.selectedMethod.value == method
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            size: 18,
                            color:
                                topupController.selectedMethod.value == method
                                    ? const Color(0xFF00B4D8)
                                    : Colors.grey,
                          );
                        }),
                        onTap: () {
                          topupController.selectedMethod.value = method;
                          topupController.selectedSubOption.value = '';
                        },
                      ),
                      Obx(() {
                        if (topupController.selectedMethod.value == method) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              children: topupController.topUpMethods[method]!
                                  .map((option) {
                                return ListTile(
                                  title: Text(
                                    option,
                                    style: const TextStyle(
                                        fontFamily: 'Poppins', fontSize: 14),
                                  ),
                                  leading: Obx(() {
                                    return Icon(
                                      topupController.selectedSubOption.value ==
                                              option
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_unchecked,
                                      color: topupController
                                                  .selectedSubOption.value ==
                                              option
                                          ? const Color(0xFF00B4D8)
                                          : Colors.grey,
                                    );
                                  }),
                                  onTap: () => topupController
                                      .selectedSubOption.value = option,
                                );
                              }).toList(),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 22),
              SizedBox(
                child: MyButton(
                  onPressed: () {
                    topupController.handleTopUp(context);
                  },
                  textButton: "Konfirmasi Top Up",
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
