import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/history_controller.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.put(HistoryController());

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "History",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: const Color(0xFFF8F9FA),
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: Obx(() {
        final history = historyController.transactionHistory.reversed
            .toList(); // Membalik urutan

        if (history.isEmpty) {
          return Center(
            child: MyText(
              text: "Tidak ada riwayat transaksi.",
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: history.length,
          itemBuilder: (context, index) {
            final transaction = history[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: transaction['type'],
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: transaction['type'] == 'Top-Up'
                              ? Colors.green
                              : Colors.red,
                        ),
                        MyText(
                          text: "Rp ${transaction['amount']}",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    MyText(
                      text: transaction['detail'],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                    const SizedBox(height: 4),
                    MyText(
                      text: _formatDate(transaction['date']),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year} ${date.hour.toString().padLeft(2, '0')}:"
        "${date.minute.toString().padLeft(2, '0')}";
  }
}
