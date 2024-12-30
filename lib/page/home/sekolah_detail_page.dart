import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/sekolah_controller.dart';
import 'package:wiscash_/page/widget/my_sekolah_bottom_sheet.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class SekolahDetailPage extends StatelessWidget {
  const SekolahDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SekolahController sekolahController = Get.put(SekolahController());

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Sekolah",
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
                  value: sekolahController.selectedJenisBiaya.value.isEmpty
                      ? null
                      : sekolahController.selectedJenisBiaya.value,
                  onChanged: (String? value) {
                    sekolahController.selectedJenisBiaya.value = value ?? "";
                  },
                  items: sekolahController.jenisBiaya.map((String biaya) {
                    return DropdownMenuItem<String>(
                      value: biaya,
                      child: MyText(
                        text: biaya,
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
                itemCount: sekolahController.nominalList.length,
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
                          return MySekolahBottomSheet(
                              nominal: sekolahController.nominalList[index]);
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
                      text: sekolahController.nominalList[index],
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
