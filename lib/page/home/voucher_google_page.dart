import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/voucher_google_controller.dart';
import 'package:wiscash_/page/widget/my_text.dart';
import 'package:wiscash_/page/widget/my_text_field.dart';
import 'package:wiscash_/page/widget/my_voucher_bottom_sheet.dart';

class VoucherGooglePage extends StatelessWidget {
  const VoucherGooglePage({super.key});

  @override
  Widget build(BuildContext context) {
    final VoucherGoogleController voucherGoogleController = Get.put(VoucherGoogleController());

    final List<String> nominalList = [
      "25.000",
      "50.000",
      "70.000",
      "100.000",
      "150.000",
      "250.000",
      "350.000",
      "500.000",
      "1.000.000",
      "1.700.000",
      "2.000.000"
    ];

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Voucher Google Play",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Google_Play_2022_logo.svg/2560px-Google_Play_2022_logo.svg.png",
                    height: 120,
                    width: 170,
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
              MyText(
                text: "User ID",
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: voucherGoogleController.userIdController,
                hintText: " ",
                prefixText: " ",
                fillColor: Colors.white,
                borderRadius: 12.0,
              ),
              const SizedBox(height: 30),
              MyText(
                text: "Pilih Nominal",
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (context) {
                          return MyVoucherBottomSheet(
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
                      padding: const EdgeInsets.symmetric(vertical: 12),
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
              SizedBox(height: 70)
            ],
          ),
        ),
      ),
    );
  }
}
