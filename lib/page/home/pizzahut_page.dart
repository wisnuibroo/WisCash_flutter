import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/component_page/promo_card_pizza_adapter.dart';
import 'package:wiscash_/controller/home/beli_pizza_controller.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class PizzahutPage extends StatelessWidget {
  const PizzahutPage({super.key});

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
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEk3vWHRjZfLXJgUPNY1cUXQ7kjHXV3_3JWxA21g2jBNF0TaELj1590nTtgUi9VjpgyOU&usqp=CAU',
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
                    text: "Pizza Hut 3 Varian Rasa",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      MyText(
                        text: "Rp234.257",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: "Rp320.900",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: "27%",
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
                        "Nikmati kelezatan pizza dengan 3 pilihan varian rasa yang menggugah selera! Dibuat dari bahan berkualitas, adonan pizza empuk dipadukan dengan keju mozzarella premium yang meleleh sempurna. Pilihan topping meliputi:",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "1. Pepperoni Klasik: Dengan irisan pepperoni gurih yang melimpah.",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "2. Daging Ayam BBQ: Topping daging ayam lembut dengan saus BBQ manis dan smoky.",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "3. Sayuran Fresh Delight: Kombinasi segar dari paprika, jamur, dan jagung manis.",
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
                  PromoCardPizzaAdapter()
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
                    productName: "Pizza Hut 3 Varian Rasa",
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
