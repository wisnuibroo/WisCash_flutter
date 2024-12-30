import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/pulsa_controller.dart';
import 'package:wiscash_/page/home/pulsa_detail_page.dart';
import 'package:wiscash_/page/widget/my_button.dart';
import 'package:wiscash_/page/widget/my_text.dart';
import 'package:wiscash_/page/widget/my_text_field.dart';

class PulsaPage extends StatelessWidget {
  const PulsaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PulsaController pulsaController = Get.put(PulsaController());

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Pulsa/Paket Data",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Center(
                child: Image.network(
                  "https://pastipayment.id/assets/img/illustration/3.png",
                  height: 170,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.broken_image,
                      size: 150,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 25),
            MyText(
              text: "Operator",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: 8),
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
                    text: "Pilih Operator",
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                  value: pulsaController.selectedOperator.value.isEmpty
                      ? null
                      : pulsaController.selectedOperator.value,
                  onChanged: (String? value) {
                    pulsaController.selectedOperator.value = value ?? "";
                  },
                  items: pulsaController.operators.map((String operator) {
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
            SizedBox(height: 15),
            MyText(
              text: "Nomor Operator",
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            SizedBox(height: 4),
            MyTextField(
              controller: pulsaController.nomorOperatorController,
              hintText: '',
              fillColor: Colors.white,
              borderRadius: 12.0,
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: MyButton(
                onPressed: () {
                  Get.to(
                    () => PulsaDetailPage(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 400),
                  );
                },
                textButton: "Lanjut",
                backgroundColor: const Color(0xFF025A5F),
                textColor: Colors.white,
                radius: 15,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
