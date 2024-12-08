import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class TopupController extends GetxController {
  final TextEditingController amountController = TextEditingController();

  var selectedMethod = ''.obs;
  var selectedSubOption = ''.obs;

  final Map<String, List<String>> topUpMethods = {
    'Bank Transfer': ['BCA', 'BRI', 'Mandiri', 'BNI'],
    'Credit/Debit Card': ['Visa', 'MasterCard', 'JCB'],
    'E-Wallet': ['OVO', 'GoPay', 'DANA', 'ShopeePay'],
    'Retail Stores': ['Alfamart', 'Indomaret'],
  };

  bool isValidTopUp() {
    final amount = int.tryParse(amountController.text);
    return amount != null &&
        amount > 0 &&
        selectedMethod.isNotEmpty &&
        selectedSubOption.isNotEmpty;
  }

  void handleTopUp(BuildContext context) {
    if (!isValidTopUp()) {
      _showErrorSnackbar("Mohon masukkan nilai yang valid.");
      return;
    }

    final amount = int.parse(amountController.text);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Top-Up"),
        content: Text(
            "Top-up Rp $amount via ${selectedMethod.value} (${selectedSubOption.value})?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          TextButton(
            onPressed: () {
              final balanceController = Get.find<BalanceController>();
              final historyController = Get.find<HistoryController>();

              balanceController.addBalance(amount);

              historyController.addTransaction(
                type: 'Top-Up',
                amount: amount,
                detail: '${selectedMethod.value} (${selectedSubOption.value})',
              );

              Navigator.pop(context);
              _showSuccessSnackbar(amount);
              amountController.clear();

              selectedMethod.value = '';
              selectedSubOption.value = '';
            },
            child: Text("Confirm"),
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
      icon: Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(10),
      borderRadius: 10,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }

  void _showSuccessSnackbar(int amount) {
    Get.snackbar(
      'Top-Up Successful',
      'Transaksi sebesar Rp $amount Berhasil!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: Icon(Icons.check_circle, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(10),
      borderRadius: 10,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}
