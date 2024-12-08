import 'package:get/get.dart';

class HistoryController extends GetxController {
 
  final RxList<Map<String, dynamic>> transactionHistory =
      <Map<String, dynamic>>[].obs;


  void addTransaction({
    required String type,
    required int amount, 
    required String
        detail, 
  }) {
    transactionHistory.add({
      'type': type,
      'amount': amount,
      'detail': detail,
      'date': DateTime.now(), 
    });

    // Batas jumlah riwayat transaksi (misalnya hanya simpan 100 riwayat terbaru)
    if (transactionHistory.length > 100) {
      transactionHistory.removeAt(0); // Hapus riwayat paling lama
    }
  }

 
}
