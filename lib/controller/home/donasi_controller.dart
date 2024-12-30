import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class DonasiController extends GetxController {
  
  final List<Map<String, String>> donasiList = [
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/e/e6/Logo_BAZNAS_RI-Hijau-01.png',
      'title': 'BAZNAS'
    },
    {
      'imageUrl':
          'https://glints.com/id/lowongan/wp-content/uploads/2021/07/4.-lowongan-public-relation-atau-pr-benihbaik-com.png',
      'title': 'BenihBaik'
    },
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/d/d9/Logo-web-dd-hijau.png',
      'title': 'Dompet Dhuafa'
    },
    {
      'imageUrl':
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEghTfmcQUwlVtT_F8dOLiT1pxpUhEfWgGDPk5J7GvvJL7hOSkepcEY-1SeZdKS3c0Di5PU9JcuJSje2Cd_dv2IerVt9rpL_lGvWYuJEaAXUWf1xXU-mXlZ06QqdMvn8JpuBN9T38zORPq8q/s400/logo.png',
      'title': 'Generasi Peduli Sesama'
    },
    {
      'imageUrl':
          'https://kontenesia.com/wp-content/uploads/2022/02/logo-kitabisa.png',
      'title': 'Kitabisa'
    },
    {
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHXjfUB7sm7TkCQWogUlZv-vg5BB8_nnh-VA&s',
      'title': 'LazisNU'
    },
    {
      'imageUrl':
          'https://rumah-yatim.org/asset/frontend/img/Logo-Rumah-Yatim-Alt.png',
      'title': 'Rumah Yatim'
    },
    {
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/id/a/a0/LOGO_RZ.png',
      'title': 'Rumah Zakat'
    },
    {
      'imageUrl':
          'https://tdasurabaya.org/wp-content/uploads/2019/12/logo-tdasurabaya.png',
      'title': 'Tangan Di Atas'
    },
    {
      'imageUrl': 'https://spgusherindonesia.com/img/clients/wecare.id.png',
      'title': 'WeCare id'
    },
    {
      'imageUrl':
          'https://www.al-azhar.or.id/wp-content/uploads/2024/07/Logo-YPIA-500px.png',
      'title': 'Yayasan Al-Azhar'
    },
    {
      'imageUrl':
          'https://images.glints.com/unsafe/glints-dashboard.oss-ap-southeast-1.aliyuncs.com/company-logo/5389365b949ce0a9adc2b75a06fa5442.png',
      'title': 'Yayasan Cinta Anak Bangsa'
    },
    {
      'imageUrl':
          'https://amalsholeh-s3.imgix.net/user-media/ZFs3HrY7c5WUS8PTBrcxXDl4XM3oRKPy5txrjlIn.png',
      'title': 'Yayasan Peduli Ummat'
    },
    {
      'imageUrl':
          'https://yayasansayapibu.or.id/wp-content/uploads/2021/03/Logo-YSI.png',
      'title': 'Yayasan Sayap Ibu'
    },
    {
      'imageUrl':
          'https://zdn.nz/site/tanganpengharapan/images/tangan-pengharapan-footer-logo.png',
      'title': 'Yayasan Tangan Harapan'
    },
    {
      'imageUrl': 'https://m.zakatpedia.com/static/media/logo.31e06fae.png',
      'title': 'Zakatpedia'
    },
  ];

  final List<String> nominalList = [
    "25.000",
    "50.000",
    "70.000",
    "100.000",
    "150.000",
    "250.000",
    "350.000",
    "500.000",
    "1.000.000"
  ];

  void handleDonasi(BuildContext context, int nominal) {
    final balanceController = Get.find<BalanceController>();
    final historyController = Get.find<HistoryController>();

    if (balanceController.balance.value < nominal) {
      _showErrorSnackbar('Saldo tidak cukup untuk donasi ini.');
      return;
    }

    balanceController.addBalance(-nominal);

    historyController.addTransaction(
      type: 'Donasi',
      amount: nominal,
      detail: 'Donasi ke tujuan tertentu',
    );

    _showSuccessSnackbar(nominal);

    Navigator.pop(context);
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      icon: const Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }

  void _showSuccessSnackbar(int nominal) {
    Get.snackbar(
      'Donasi Berhasil',
      'Donasi sebesar Rp $nominal berhasil dilakukan!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }
}
