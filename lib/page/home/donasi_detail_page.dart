import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/donasi_controller.dart';
import 'package:wiscash_/page/widget/my_donasi_bottom_sheet.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class DonasiDetailPage extends StatelessWidget {
  const DonasiDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DonasiController donasiController = Get.put(DonasiController());

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Donasi",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            MyText(
              text: "Pilih Nominal",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.5,
                ),
                itemCount: donasiController.nominalList.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (context) {
                          return MyDonasiBottomSheet(
                              nominal: donasiController.nominalList[index]);
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      elevation: 2,
                    ),
                    child: MyText(
                      text: donasiController.nominalList[index],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
