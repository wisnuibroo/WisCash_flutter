import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/favorite_controller.dart';
import 'package:wiscash_/model/model_favorite.dart';

class MyFavoriteCard extends StatelessWidget {
  final String imagePath;
  final String name;

  final List<Widget>? button;

  MyFavoriteCard({
    Key? key,
    required this.imagePath,
    required this.name,
    this.button,
  }) : super(key: key);

  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    var isFavorite = RxBool(
        favoriteController.tasks.any((favorite) => favorite.title == name));
    return Card(
      color: const Color(0xFF383838),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 100,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const SizedBox(height: 12),
                  if (button != null)
                    Row(
                      children: button!,
                    ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Obx(() => GestureDetector(
                  onTap: () {
                    if (isFavorite.value) {
                      favoriteController.deleteTaskByTitle(name);
                      Get.snackbar(
                        "Removed from Favorites",
                        "$name telah di hapus dari favorite!",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    } else {
                      favoriteController.addTask(ModelFavorite(
                        title: name,
                        imagePath: imagePath,
                      ));
                      Get.snackbar(
                        "Added to Favorites",
                        "$name telah di tambahkan ke favorite!",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    }

                    isFavorite.value = !isFavorite.value;
                  },
                  child: Icon(
                    isFavorite.value ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite.value ? Colors.red : Colors.white,
                    size: 24,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
