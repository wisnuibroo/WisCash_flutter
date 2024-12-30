import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class PerguruanController extends GetxController {
  final TextEditingController amountController = TextEditingController();
  final selectedJenisBiaya = ''.obs;

  final List<String> jenisBiaya = [
    "SPP",
    "Uang Pangkal",
    "Uang Asrama",
    "Infaq"
  ];

  final List<String> nominalList = [
    "25.000",
    "50.000",
    "70.000",
    "100.000",
    "150.000",
    "250.000",
    "350.000",
    "500.000",
    "1.000.000"
  ];

  void handlePerguruan(BuildContext context, int nominal) {
    final balanceController = Get.find<BalanceController>();
    final historyController = Get.find<HistoryController>();

    if (selectedJenisBiaya.value.isEmpty) {
      _showErrorSnackbar('Pilih jenis biaya terlebih dahulu.');
      return;
    }

    if (balanceController.balance.value < nominal) {
      _showErrorSnackbar('Saldo tidak cukup untuk transaksi.');
      return;
    }

    balanceController.addBalance(-nominal);

    historyController.addTransaction(
      type: 'Tagihan Perguruan Tinggi',
      amount: nominal,
      detail: 'Bayar ${selectedJenisBiaya.value}',
    );

    amountController.clear();

    _showSuccessSnackbar('Tagihan Perguruan Tinggi', nominal);

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
    amountController.dispose();
    super.onClose();
  }
}
