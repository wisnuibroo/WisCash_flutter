import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class VoucherGoogleController extends GetxController {
  final TextEditingController userIdController = TextEditingController(); 
  final TextEditingController amountController = TextEditingController();

  void handleVoucherGoogle(BuildContext context, int nominal) {
    final balanceController = Get.find<BalanceController>();
    final historyController = Get.find<HistoryController>();

    if (userIdController.text.isEmpty) {
      _showErrorSnackbar('Masukkan User ID terlebih dahulu.');
      return;
    }

    if (balanceController.balance.value < nominal) {
      _showErrorSnackbar('Saldo tidak cukup untuk transaksi.');
      return;
    }


    balanceController.addBalance(-nominal);

  
    historyController.addTransaction(
      type: 'Voucher Google Play',
      amount: nominal,
      detail: 'Transaksi Voucher Google Play untuk User ID ${userIdController.text}',
    );

    // Membersihkan input
    userIdController.clear();
    amountController.clear();


    _showSuccessSnackbar('Voucher Google Play', nominal);

    Navigator.pop(context);
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

  void _showSuccessSnackbar(String title, int nominal) {
    Get.snackbar(
      title,
      'Transaksi sebesar Rp $nominal berhasil.',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }

  @override
  void onClose() {
    userIdController.dispose(); 
    amountController.dispose();
    super.onClose();
  }
}
