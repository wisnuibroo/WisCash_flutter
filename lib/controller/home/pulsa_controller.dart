import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class PulsaController extends GetxController {
  final nomorOperatorController = TextEditingController();
  final selectedOperator = ''.obs;

  void handlePulsa(BuildContext context, int nominal) {
    final balanceController = Get.find<BalanceController>();
    final historyController = Get.find<HistoryController>();

    if (selectedOperator.value.isEmpty) {
      _showErrorSnackbar('Pilih operator terlebih dahulu.');
      return;
    }

    if (nomorOperatorController.text.isEmpty) {
      _showErrorSnackbar('Nomor operator tidak boleh kosong.');
      return;
    }

    if (balanceController.balance.value < nominal) {
      _showErrorSnackbar('Saldo tidak cukup untuk membayar pulsa.');
      return;
    }

    balanceController.addBalance(-nominal);

    historyController.addTransaction(
      type: 'Pulsa',
      amount: nominal,
      detail: 'Isi Ulang Pulsa ${selectedOperator.value}',
    );

    nomorOperatorController.clear();

    _showSuccessSnackbar(nominal);
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

  void _showSuccessSnackbar(int nominal) {
    Get.snackbar(
      'Isi Ulang Pulsa Berhasil',
      'Isi Ulang sebesar Rp $nominal berhasil dilakukan!',
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
    nomorOperatorController.dispose();
    super.onClose();
  }
}
