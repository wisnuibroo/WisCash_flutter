import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class BeliTiketController extends GetxController {
  void handleBeliTicket({
    required BuildContext context,
    required String titleTiket,
    required int hargaTiket,
  }) {
    final balanceController = Get.find<BalanceController>();
    final historyController = Get.find<HistoryController>();

    if (balanceController.balance.value < hargaTiket) {
      _showErrorSnackbar("Saldo tidak cukup untuk membeli tiket ini.");
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi Pembelian Tiket"),
        content: Text(
            "Apakah Anda yakin ingin membeli tiket '$titleTiket' seharga Rp $hargaTiket?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              balanceController.addBalance(-hargaTiket);

              historyController.addTransaction(
                type: 'Beli Tiket',
                amount: hargaTiket,
                detail: titleTiket,
              );

              Navigator.pop(context);

              _showSuccessSnackbar(titleTiket, hargaTiket);
            },
            child: const Text("Konfirmasi"),
          ),
        ],
      ),
    );
  }

  void _showSuccessSnackbar(String tiketTitle, int tiketPrice) {
    Get.snackbar(
      'Pembelian Berhasil',
      'Tiket "$tiketTitle" berhasil dibeli seharga Rp $tiketPrice!',
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
