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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                    padding: EdgeInsets.all(16),
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
                    ));
              }),
              SizedBox(height: 24),
              MyText(
                text: "Masukkan Nominal",
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              SizedBox(height: 8),
              MyTextField(
                controller: topupController.amountController,
                hintText: '',
                prefixText: 'Rp ',
                fillColor: Colors.white,
                borderRadius: 12.0,
              ),
              SizedBox(height: 24),
              MyText(
                text: "Pilih Metode Top Up",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 8),
              Column(
                children: topupController.topUpMethods.keys.map((method) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.account_balance_wallet,
                            color: const Color(0xFF025A5F)),
                        title: Text(
                          method,
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
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
                            padding: EdgeInsets.only(left: 16.0),
                            child: Column(
                              children: topupController.topUpMethods[method]!
                                  .map((option) {
                                return ListTile(
                                  title: Text(
                                    option,
                                    style: TextStyle(
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
                          return SizedBox();
                        }
                      }),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 22),
              SizedBox(
                child: MyButton(
                  onPressed: () {
                    topupController.handleTopUp(context);
                  },
                  textButton: "Konfirmasi Top Up",
                  backgroundColor: const Color(0xFF025A5F),
                  textColor: Colors.white,
                  radius: 20,
                  width: double.infinity,
                  height: 40,
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
