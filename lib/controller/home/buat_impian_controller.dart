import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuatImpianController extends GetxController {
  var namaImpianController = TextEditingController().obs;
  var jumlahTargetController = TextEditingController().obs;

  var isFormValid = true.obs;

  var listImpian = <Map<String, String>>[].obs;

  void submitForm() {
    String namaImpian = namaImpianController.value.text;
    String jumlahTarget = jumlahTargetController.value.text;


    if (int.tryParse(jumlahTarget) == null) {
      _showErrorSnackbar("Jumlah target harus berupa angka.");
      return;
    }

    if (namaImpian.isEmpty || jumlahTarget.isEmpty) {
      isFormValid.value = false;
      _showErrorSnackbar("Semua field harus diisi!");
    } else {
      isFormValid.value = true;
      _showSuccessSnackbar("Impian berhasil dibuat!");


      listImpian.add({'nama': namaImpian, 'target': jumlahTarget});

      namaImpianController.value.clear();
      jumlahTargetController.value.clear();
    }
  }


  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      icon: Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(10),
      borderRadius: 10,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }


  void _showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: Icon(Icons.check_circle, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(10),
      borderRadius: 10,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }
}
