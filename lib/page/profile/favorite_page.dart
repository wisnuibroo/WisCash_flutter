import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wiscash_/controller/favorite_controller.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoriteController favoriteController = Get.put(FavoriteController());
    favoriteController.loadTasks();

    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Favorite",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (favoriteController.tasks.isEmpty) {
                  return const Center(
                    child: Text(
                      'Anda belum menambahkan movies favorite.',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: favoriteController.tasks.length,
                  itemBuilder: (context, index) {
                    final favoriteMovie = favoriteController.tasks[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      color: Color(0xFF025A5F),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            favoriteMovie.imagePath,
                            width: 50,
                            height: 75,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          favoriteMovie.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            Get.defaultDialog(
                              title: "Hapus Favorit?",
                              middleText:
                                  "Apakah Anda yakin ingin menghapus ${favoriteMovie.title} dari daftar favorit?",
                              confirmTextColor: Colors.white,
                              cancelTextColor: Colors.white,
                              buttonColor: Colors.red,
                              cancel: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: MyText(
                                    text: "No",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              confirm: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  favoriteController
                                      .deleteTaskByTitle(favoriteMovie.title);
                                  Get.back();
                                  Get.snackbar(
                                    "Dihapus dari Favorit",
                                    "${favoriteMovie.title} telah dihapus dari favorit Anda!",
                                    snackPosition: SnackPosition.TOP,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                },
                                child: MyText(
                                    text: "Yes",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
