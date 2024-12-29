import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/perguruan_controller.dart';
import 'package:wiscash_/page/widget/my_perguruan_bottom_sheet.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class PerguruanDetailPage extends StatelessWidget {
  const PerguruanDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PerguruanController perguruanController =
        Get.put(PerguruanController());

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

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Perguruan Tinggi",
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            MyText(
                text: "Jenis Biaya",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            SizedBox(height: 10),
            Obx(() {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: SizedBox(),
                  hint: MyText(
                    text: "Pilih Jenis Biaya",
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                  value: perguruanController.selectedJenisBiaya.value.isEmpty
                      ? null
                      : perguruanController.selectedJenisBiaya.value,
                  onChanged: (String? value) {
                    perguruanController.selectedJenisBiaya.value = value ?? "";
                  },
                  items: jenisBiaya.map((String operator) {
                    return DropdownMenuItem<String>(
                      value: operator,
                      child: MyText(
                        text: operator,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
            SizedBox(height: 30),
            MyText(
              text: "Pilih Nominal",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.5,
                ),
                itemCount: nominalList.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (context) {
                          return MyPerguruanBottomSheet(
                            nominal: nominalList[index],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      elevation: 2,
                    ),
                    child: MyText(
                      text: nominalList[index],
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
