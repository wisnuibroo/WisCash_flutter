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
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Obx(() {
        final history = historyController.transactionHistory.reversed.toList();

        if (history.isEmpty) {
          return Center(
            child: MyText(
              text: "Tidak ada history transaksi terbaru.",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          itemCount: history.length,
          itemBuilder: (context, index) {
            final transaction = history[index];
            final isTopUp = transaction['type'] == 'Top-Up';

            return Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                gradient: isTopUp
                    ? LinearGradient(
                        colors: [Color(0xFF025A5F), Color(0xFF00B4D8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : LinearGradient(
                        colors: [Color(0xFFF44336), Color(0xFFF96B60)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              isTopUp
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(width: 8),
                            MyText(
                              text: transaction['type'],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        MyText(
                          text: "Rp ${transaction['amount']}",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    MyText(
                      text: transaction['detail'],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                    const SizedBox(height: 8),
                    MyText(
                      text: _formatDate(transaction['date']),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white60,
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
        "${date.year} ${date.hour.toString().padLeft(2, '0')}:" // Mengubah format tanggal
        "${date.minute.toString().padLeft(2, '0')}";
  }
}
