import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/component_page/rekomendasi_adapter.dart';
import 'package:wiscash_/controller/home/belitiket_controller.dart';
import 'package:wiscash_/controller/favorite_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class RekomendasiLainnyaPage extends StatelessWidget {
  const RekomendasiLainnyaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoryController());
    
    final favoriteController = Get.put(FavoriteController());
    final beliTiketController = Get.put(BeliTiketController());

    favoriteController.loadTasks();

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Rekomendasi Lainnya",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              MyText(
                text: "   Tiket Liburan",
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              RekomendasiAdapter(
                title: "Pantai Kuta | Bali, Indonesia",
                imagePath: "assets/image/pantai-kuta-bali.png",
                harga: "Rp5000",
              ),
              RekomendasiAdapter(
                title: "Nusa Penida | Bali, Indonesia",
                imagePath: "assets/image/nusa-penida-bali.png",
                harga: "Rp105.000",
              ),
              RekomendasiAdapter(
                title: "Candi Prambanan | Yogyakarta, Indonesia",
                imagePath: "assets/image/candi-prambanan.png",
                harga: "Rp50.000",
              ),
              RekomendasiAdapter(
                title: "Candi Borobudur | Yogyakarta, Indonesia",
                imagePath: "assets/image/candi-borobudur.png",
                harga: "Rp150.000",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
