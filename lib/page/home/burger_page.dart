import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/component_page/promo_card_burger_adapter.dart';
import 'package:wiscash_/controller/home/beli_sekarang_controller.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class BurgerPage extends StatelessWidget {
  const BurgerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final beliSekarangController = Get.put(BeliSekarangController());

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Detail Produk",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://awsimages.detik.net.id/community/media/visual/2021/03/31/pork-burger-4.jpeg?w=7244',
                  height: 150,
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Burger Beef And Cheese Jumbo",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      MyText(
                        text: "Rp70.000",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: "Rp101.449",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: "31%",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  MyText(
                    text: "Deskripsi",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  MyText(
                    text:
                        "Nikmati kelezatan Burger Daging Sapi dengan rasa yang lembut dan gurih! Dibuat dari daging sapi pilihan yang dipanggang atau digoreng hingga sempurna, Dengan rasa yang ringan namun menggugah, Burger Daging Ayam ini cocok untuk Anda yang mencari makanan praktis namun penuh rasa.",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "1. Hidangan Elegand: Dengan tumpukan yang gurih dan melimpah.",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "2. Daging Sapi: Isi daging sapi lembut dengan saus keju manis dan melimpah.",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "3. Sayuran Fresh Delight: Kombinasi segar dari selada, jamur, dan tomat.",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Serupa dan mungkin kamu suka",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  PromoCardBurgerAdapter()
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.green),
                ),
                child: MyText(
                    text: "Keranjangmu +1",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  beliSekarangController.handleBeliSekarang(
                    context: context,
                    productName: "Burger Beef And Chese Jumbo",
                    price: 70000,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: MyText(
                  text: "Beli Sekarang",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
