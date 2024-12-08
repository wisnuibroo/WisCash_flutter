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

  const RekomendasiAdapter({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.harga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.find<FavoriteController>();
    final beliTiketController = Get.find<BeliTiketController>();

    void showNotification(String message, {bool isSuccess = true}) {
      Get.snackbar(
        isSuccess ? "Berhasil" : "Dihapus",
        message,
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
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
                    color: Colors.white,
                    size: 30,
                  ),
                );
              }),
            ),
          ],
        ),
        const SizedBox(height: 10),
        MyText(
          text: title,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        const SizedBox(height: 5),
        MyText(
          text: "Harga tiket: $harga",
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        const SizedBox(height: 10),
        MyButton(
          onPressed: () {
            int hargaTiket = int.parse(harga.replaceAll(RegExp(r'\D'), ''));
            beliTiketController.handleBeliTicket(
              context: context,
              titleTiket: title,
              hargaTiket: hargaTiket,
            );
          },
          textButton: "Beli Tiket",
          backgroundColor: const Color(0xFF025A5F),
          textColor: Colors.white,
          radius: 15,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
