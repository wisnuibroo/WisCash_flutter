import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/component_page/promo_card_lobster_adapter.dart';
import 'package:wiscash_/controller/home/beli_sekarang_controller.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class LobsterPage extends StatelessWidget {
  const LobsterPage({super.key});

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
                  'https://img.okezone.com/content/2020/11/27/298/2317559/rasa-kurang-lezat-ketahui-7-kesalahan-memasak-lobster-Q4Ho0wUVLD.jpg',
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
                    text: "Lobster Saus Keju Jumbo",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      MyText(
                        text: "Rp306.800",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: "Rp601.569",
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                      SizedBox(width: 8),
                      MyText(
                        text: "49%",
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
                        "Hidangan lobster segar yang menggugah selera ini menghadirkan cita rasa laut yang mewah dan autentik. Tekstur dagingnya yang lembut dan juicy menjadi keunggulan utama, dipadukan dengan rasa manis alami khas lobster yang begitu lezat.",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "1. Protein Tinggi: Lobster kaya akan protein berkualitas tinggi yang penting untuk pertumbuhan, perbaikan jaringan tubuh, dan menjaga kesehatan otot.",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "2. Rendah Lemak dan Kalori: Lobster mengandung lemak yang relatif rendah dan kalori yang terkontrol, menjadikannya pilihan yang baik untuk diet sehat.",
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                  ),
                  MyText(
                    text:
                        "3. Kolin: Nutrisi yang berperan penting dalam kesehatan otak dan fungsi saraf.",
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
                  PromoCardLobsterAdapter()
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
                    productName: "Lobster Saus Keju Jumbo",
                    price: 306800,
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
