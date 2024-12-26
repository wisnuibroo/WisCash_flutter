import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class TagihanListrikController extends GetxController {
  final TextEditingController nomorMeterController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  var nomorTerakhir = ''.obs; // Menyimpan nomor meter terakhir yang dimasukkan

  void handleTokenListrik(BuildContext context) {
    final balanceController = Get.find<BalanceController>();
    final historyController = Get.find<HistoryController>();

    final inputNomorMeter = nomorMeterController.text;
    if (inputNomorMeter.isEmpty) {
      _showErrorSnackbar('Nomor meter tidak boleh kosong.');
      return;
    }

    final nomorMeter = int.tryParse(inputNomorMeter);
    if (nomorMeter == null) {
      _showErrorSnackbar('Nomor meter harus berupa angka.');
      return;
    }

    final inputNominal = amountController.text;
    if (inputNominal.isEmpty) {
      _showErrorSnackbar('Nominal tidak boleh kosong.');
      return;
    }

    final nominal = int.tryParse(inputNominal);
    if (nominal == null || nominal <= 0) {
      _showErrorSnackbar('Nominal harus berupa angka.');
      return;
    }

    if (balanceController.balance.value < nominal) {
      _showErrorSnackbar('Saldo tidak cukup untuk membayar token listrik.');
      return;
    }

    // Update nomor meter terakhir
    nomorTerakhir.value = inputNomorMeter;

    // Potong saldo
    balanceController.addBalance(-nominal);

    historyController.addTransaction(
      type: 'Tagihan Listrik',
      amount: nominal,
      detail: 'Pembayaran tagihan listrik untuk nomor meter $nomorMeter',
    );

    nomorMeterController.clear();
    amountController.clear();

    _showSuccessSnackbar(nominal);
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
      'Berhasil',
      'Pembayaran token listrik sebesar Rp $nominal berhasil.',
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
    nomorMeterController.dispose();
    amountController.dispose();
    super.onClose();
  }
}
