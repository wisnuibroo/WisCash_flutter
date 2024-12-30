import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class AirpdamController extends GetxController {
  final TextEditingController nomorPelangganController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final selectedLokasi = ''.obs;
  var nomorTerakhir = ''.obs;

  final List<String> lokasi = [
      "Surabaya",
      "Semarang",
      "Bandung",
      "Jakarta",
      "Tangerang",
      "Yogyakarta",
      "Surakarta"
    ];

  void handleAirPDAM(BuildContext context) {
    final balanceController = Get.find<BalanceController>();
    final historyController = Get.find<HistoryController>();

    if (selectedLokasi.value.isEmpty) {
      _showErrorSnackbar('Pilih lokasi terlebih dahulu.');
      return;
    }

    final inputNomorPelanggan = nomorPelangganController.text;
    if (inputNomorPelanggan.isEmpty) {
      _showErrorSnackbar('Nomor pelanggan tidak boleh kosong.');
      return;
    }

    final nomorPelanggan = int.tryParse(inputNomorPelanggan);
    if (nomorPelanggan == null) {
      _showErrorSnackbar('Nomor pelanggan harus berupa angka.');
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
      _showErrorSnackbar('Saldo tidak cukup untuk membayar PDAM.');
      return;
    }

    balanceController.addBalance(-nominal);

    historyController.addTransaction(
      type: 'Air PDAM',
      amount: nominal,
      detail: 'Tagihan Air PDAM ${selectedLokasi.value}',
    );

    nomorTerakhir.value = inputNomorPelanggan;
    nomorPelangganController.clear();
    amountController.clear();

    _showSuccessSnackbar('Tagihan Air PDAM', nominal);
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
    nomorPelangganController.dispose();
    amountController.dispose();
    super.onClose();
  }
}
