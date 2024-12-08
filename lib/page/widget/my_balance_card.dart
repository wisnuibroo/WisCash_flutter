import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/page/home/history_page.dart';
import 'package:wiscash_/page/home/tariktunai_page.dart';
import 'package:wiscash_/page/home/toptup_page.dart';
import 'package:wiscash_/page/home/transfer_page.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class MyBalanceCard extends StatelessWidget {
  final BalanceController balanceController = Get.put(BalanceController());
  MyBalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF025A5F),
            Color(0xFF00B4D8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyText(
            text: "Total Saldo",
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
          Obx(() {
            return Text(
              'Rp ${balanceController.balance.value.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (match) => '${match[1]}.')}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            );
          }),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.add_business_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.to(
                        () => TopupPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    },
                  ),
                  const MyText(
                    text: "Top Up",
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.send_to_mobile,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.to(
                        () => TransferPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    },
                  ),
                  const MyText(
                    text: "Transfer",
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.account_balance_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.to(
                        () => TariktunaiPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    },
                  ),
                  const MyText(
                    text: "Tarik Tunai",
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.manage_search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.to(
                        () => HistoryPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    },
                  ),
                  const MyText(
                    text: "History",
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
