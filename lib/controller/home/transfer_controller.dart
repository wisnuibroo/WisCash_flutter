import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class TransferController extends GetxController {
  final recipientController = TextEditingController();
  final amountController = TextEditingController();

  bool isValidTransfer() {
    final recipient = recipientController.text.trim();
    final amountText = amountController.text.trim();

    if (recipient.isEmpty || amountText.isEmpty) return false;

    final amount = int.tryParse(amountText.replaceAll(RegExp(r'[^\d]'), ''));
    return amount != null && amount > 0;
  }

  void handleTransfer(BuildContext context) {
    if (!isValidTransfer()) {
      _showErrorSnackbar('Masukkan nomor tujuan dan nominal dengan benar.');
      return;
    }

    final recipient = recipientController.text.trim();
    final amount = int.parse(
        amountController.text.trim().replaceAll(RegExp(r'[^\d]'), ''));

    final balanceController = Get.find<BalanceController>();
    final currentBalance = balanceController.balance.value;

    if (currentBalance < amount) {
      _showErrorSnackbar('Saldo tidak mencukupi untuk transfer.');
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi Transfer"),
        content: Text("Transfer Rp $amount ke nomor +62 $recipient?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              balanceController.addBalance(-amount);
              final historyController = Get.find<HistoryController>();
              historyController.addTransaction(
                type: 'Transfer',
                amount: amount,
                detail: 'Ke +62 $recipient',
              );

              Navigator.pop(context);
              _showSuccessSnackbar(recipient, amount);

              recipientController.clear();
              amountController.clear();
            },
            child: const Text("Konfirmasi"),
          ),
        ],
      ),
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

  void _showSuccessSnackbar(String recipient, int amount) {
    Get.snackbar(
      'Transfer Berhasil',
      'Berhasil mentransfer Rp $amount ke +62 $recipient',
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
    recipientController.dispose();
    amountController.dispose();
    super.onClose();
  }
}
