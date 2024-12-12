import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class BeliPizzaController extends GetxController {
  void handleBeliSekarang({
    required BuildContext context,
    required String productName,
    required int price,
  }) {
    final balanceController = Get.find<BalanceController>();
    final historyController = Get.find<HistoryController>();

    if (balanceController.balance.value < price) {
      _showErrorSnackbar("Saldo tidak cukup untuk membeli produk ini.");
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi Pembelian"),
        content: Text(
            "Apakah Anda yakin ingin membeli '$productName' seharga Rp $price?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              balanceController.addBalance(-price);

              historyController.addTransaction(
                type: 'Beli Produk',
                amount: price,
                detail: productName,
              );

              Navigator.pop(context);

              _showSuccessSnackbar(productName, price);
            },
            child: const Text("Konfirmasi"),
          ),
        ],
      ),
    );
  }

  void _showSuccessSnackbar(String productName, int price) {
    Get.snackbar(
      'Pembelian Berhasil',
      '$productName berhasil dibeli seharga Rp $price!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      icon: const Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }
}
