import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/component_page/promo_card_kobesteak_adapter.dart';
import 'package:wiscash_/controller/home/beli_sekarang_controller.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class KobeSteakPage extends StatelessWidget {
  const KobeSteakPage({super.key});

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
                  'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/a1/33/dc/caption.jpg?w=1200&h=-1&s=1',
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
                    text: "Kobe Beef Steak Sakura",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      MyText(
                        text: "Rp855.000",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: "Rp1.500.000",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: "43%",
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
                        "Daging sapi Kobe premium yang dikenal dengan tekstur lembut dan marbling sempurna memberikan sensasi juicy di setiap gigitan. Dipadukan dengan saus khas yang kaya rasa, steak ini memancarkan aroma menggoda yang membuat Anda tak sabar untuk mencicipinya.",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text: "1. Bakaran Premium: Dibakar dengan api merapi .",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "2. Daging Sapi BBQ: Sapi bakaran yang menggoda dan fresh",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "3. Texture: Kombinasi segar dari dagin sapi dan bumbu racikan.",
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
                  PromoCardKobesteakAdapter()
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
                    productName: "Kobe Beef Steak Sakura",
                    price: 855000,
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
