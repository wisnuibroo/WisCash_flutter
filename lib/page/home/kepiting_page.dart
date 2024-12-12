import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/component_page/promo_card_kepiting_adapter.dart';
import 'package:wiscash_/component_page/promo_card_pizza_adapter.dart';
import 'package:wiscash_/controller/home/beli_pizza_controller.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class KepitingPage extends StatelessWidget {
  const KepitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final beliTiketController = Get.put(BeliPizzaController());

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
                  'https://cdn.idntimes.com/content-images/community/2022/04/fromandroid-09bf54918d79163f511080b7150d68fb_600x400.jpg',
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
                    text: "Kepiting Saus Madu Sedang",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      MyText(
                        text: "Rp340.000",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: "Rp400.000",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: "15%",
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
                        "hidangan istimewa yang memadukan daging kepiting segar dengan saus madu yang kaya rasa! Kepiting berkualitas tinggi diolah sempurna hingga menghasilkan daging yang lembut dan juicy, dipadukan dengan saus madu manis gurih yang meresap ke setiap serat daging.",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "Saus madunya memberikan sentuhan manis alami dengan hint gurih dan aroma rempah yang menggugah selera, menjadikan setiap gigitan begitu memanjakan. Hidangan ini cocok untuk disantap bersama keluarga atau teman, menciptakan momen makan yang istimewa dan berkesan.",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "1. Kepiting Crispy: Kepiting dengan texture crispy dan delisius, ala-ala jepang yang elegant",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "2. Bumbu Delisius: Kombinasi saus, timun, tomat dan selada yang menggoda selera.",
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
                  PromoCardKepitingAdapter()
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
                  beliTiketController.handleBeliSekarang(
                    context: context,
                    productName: "Kepiting Saus Madu Sedang",
                    price: 234257,
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
