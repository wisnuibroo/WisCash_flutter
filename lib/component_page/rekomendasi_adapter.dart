import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/favorite_controller.dart';
import 'package:wiscash_/controller/home/belitiket_controller.dart';
import 'package:wiscash_/model/model_favorite.dart';
import 'package:wiscash_/page/widget/my_button.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class RekomendasiAdapter extends StatelessWidget {
  final String title;
  final String imagePath;
  final String harga;
  final double rating;

  const RekomendasiAdapter({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.harga,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    final beliTiketController = Get.find<BeliTiketController>();

    void showNotification(String message, {bool isSuccess = true}) {
      Get.snackbar(
        isSuccess ? "Berhasil" : "Gagal",
        message,
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MyText(
                    text: "Preferred Partner",
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 14,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "$rating",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            harga,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: MyButton(
                  onPressed: () {
                    int hargaTiket =
                        int.parse(harga.replaceAll(RegExp(r'\D'), ''));
                    beliTiketController.handleBeliTicket(
                      context: context,
                      titleTiket: title,
                      hargaTiket: hargaTiket,
                    );
                  },
                  textButton: "Beli Tiket",
                  backgroundColor: const Color(0xFF025A5F),
                  textColor: Colors.white,
                  radius: 12,
                ),
              ),
              const SizedBox(width: 10),
              Positioned(
                top: 10,
                right: 10,
                child: Obx(() {
                  bool isFavorite = favoriteController.tasks
                      .any((favorite) => favorite.title == title);
                  return IconButton(
                    onPressed: () {
                      if (isFavorite) {
                        favoriteController.deleteTaskByTitle(title);
                        showNotification("$title dihapus dari favorit!",
                            isSuccess: false);
                      } else {
                        favoriteController.addTask(
                          ModelFavorite(
                            title: title,
                            imagePath: imagePath,
                          ),
                        );
                        showNotification("$title ditambahkan ke favorit!");
                      }
                    },
                    icon: Icon(
                      isFavorite ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.grey,
                      size: 30,
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
