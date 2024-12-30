import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class InternetController extends GetxController {

final List<Map<String, String>> internetList = [
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Biznet_Home_Logo.svg/800px-Biznet_Home_Logo.svg.png',
      'title': 'Biznet Home'
    },
    {
      'imageUrl':
          'https://lenna-prod.s3.ap-southeast-1.amazonaws.com/upload/602/webchat/logocbn.png',
      'title': 'CBN'
    },
    {
      'imageUrl':
          'https://images.glints.com/unsafe/1200x0/glints-dashboard.oss-ap-southeast-1.aliyuncs.com/company-logo/794e93822512c1c4bd6bfe291d7ee427.png',
      'title': 'Comet Internet'
    },
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/First_Media_logo.svg/1200px-First_Media_logo.svg.png',
      'title': 'First Media'
    },
    {
      'imageUrl':
          'https://pendaftaran-indihome.net/wp-content/uploads/2023/07/logo_indiHome-1.png',
      'title': 'Indihome'
    },
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/6/61/Indovision.png',
      'title': 'Indovision'
    },
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/e/ea/K-VISION.png',
      'title': 'K-Vision'
    },
    {
      'imageUrl': 'https://img.uncyc.org/id/f/ff/MNCMedia2015.png',
      'title': 'MNC Vision'
    },
    {
      'imageUrl':
          'https://myrepublic-jabodetabek.com/wp-content/uploads/2020/11/my-republic-brand-copy-crop.png',
      'title': 'MyRepublic'
    },
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Okevision.svg/3543px-Okevision.svg.png',
      'title': 'Oke Vision'
    },
    {
      'imageUrl':
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhPGiUhbBtvHJXW_YRTOHnZ3p70Tnhu2TY-5OerbF8QIfFZlw-VEq7ZESKeaDA9Db9Ji_rrwuKVUyTSFthN1jbu4QGwm6WSmfJ51YZkIy0-w8aqQNwZWS3oxIdrmsCNjLVTuNIVa4X2P78/w600/Trans+Vision.png',
      'title': 'Transvision'
    },
    {
      'imageUrl':
          'https://xlhomefiber.com/wp-content/uploads/2024/11/sempak.png',
      'title': 'XL Home/XL Satu'
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

  void handleInternet(BuildContext context, int nominal) {
    final balanceController = Get.find<BalanceController>();
    final historyController = Get.find<HistoryController>();

    if (balanceController.balance.value < nominal) {
      _showErrorSnackbar('Saldo tidak cukup untuk transaksi ini.');
      return;
    }

    balanceController.addBalance(-nominal);

    historyController.addTransaction(
      type: 'Internet & TV Kabel',
      amount: nominal,
      detail: 'Transaksi Internet & TV Kabel',
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
      'Transaksi Berhasil',
      'Transaksi sebesar Rp $nominal berhasil dilakukan!',
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
