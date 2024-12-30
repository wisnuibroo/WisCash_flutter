import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class PerguruanController extends GetxController {
  final TextEditingController amountController = TextEditingController();
  final selectedJenisBiaya = ''.obs;

final List<Map<String, String>> perguruanList = [
    {
      "imageUrl":
          "https://i.pinimg.com/originals/16/5b/9a/165b9ab33b157cbf309ba43d5a4992bf.png",
      "title": "Universitas Indonesia"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHlQGhLVIrh5c39ZRGRcjQRneuinLHZct8KQ&s",
      "title": "Universitas Gadjah Mada"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/id/9/95/Logo_Institut_Teknologi_Bandung.png",
      "title": "Institut Teknologi Bandung"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyFVPk1ObXCkhYMZ7WiosfAYuxvPmwfDBRlA&s",
      "title": "Institut Pertanian Bogor (IPB University)"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/6/65/Logo-Branding-UNAIR-biru.png",
      "title": "Universitas Airlangga"
    },
    {
      "imageUrl":
          "https://www.its.ac.id/wp-content/uploads/2020/07/Lambang-ITS-2-300x300.png",
      "title": "Institut Teknologi Sepuluh Nopember"
    },
    {
      "imageUrl":
          "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiSIiHrqxGOhdiRxvgYxoBrIbJguzC0gkrd0TSM75ExtIEpVDra6TJzjo162SsM0ZgCVML32XAWI-sM2x5Wm5p8v0xi50K0AKD2SnWFmMkLR4VmaiTqEFu5Kg4RcKYDJg3MH_w764w36Z5PPZblPaIqJ0jGQUSz8BUSjLNRw0jc6tIHm9O6uKlCrg/w283-h320/Universitas%20Hasanuddin%20Logo.png",
      "title": "Universitas Hasanuddin"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Logo_Universitas_Brawijaya.svg/2036px-Logo_Universitas_Brawijaya.svg.png",
      "title": "Universitas Brawijaya"
    },
    {
      "imageUrl":
          "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjfrQOZ0b-ynwwb5q30jpKCzDJQ52yhSrTv7Zx1zpt4QDeimlLVQsb3Cg_KzG-f-01pbd78GSCuYuIXPSOqEM5ppnDE-4yJ7Li2choozy8UtMHDJy_SVeo-har_bTAJM8AGiNDkb0vFN6prvRMKICsxuKO5jg4eRZHIw_8fG_lySOwP9yHMwNFhFw/w320-h320/UNS%20(Universitas%20Sebelas%20Maret)%20Logo.png",
      "title": "Universitas Sebelas Maret"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/id/thumb/0/09/Logo_Almamater_UPI.svg/1200px-Logo_Almamater_UPI.svg.png",
      "title": "Universitas Pendidikan Indonesia"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Logo_Unand.svg/2048px-Logo_Unand.svg.png",
      "title": "Universitas Andalas"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/id/thumb/8/80/Lambang_Universitas_Padjadjaran.svg/1200px-Lambang_Universitas_Padjadjaran.svg.png",
      "title": "Universitas Padjadjaran"
    },
    {
      "imageUrl":
          "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjsxV3-2QG1cMepVLn8_kupbHyEnCcSNXpBbthC5v16Afl_krz9jr1Urx1boUrIROhkeqBSaVQgdowsp8bLkruWngdohvUaqZDTN-aLmBbEG5s2jnwSbI-ahuLcmNjZbInYx5N2fqF4ih-quwPrT6ZcFe2kdDXw_bR0xdMUInxzuKmstM6Xi23Zdw/w318-h320/Universitas%20Lambung%20Mangkurat%20(KoleksiLogo.com).png",
      "title": "Universitas Lambung Mangkurat"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/4/49/LOGO_LABSCHOOL-OK-CETAK.png",
      "title": "Universitas Negeri Jakarta"
    },
    {
      "imageUrl": "https://skpi.unnes.ac.id/v1/resources/images/logo_unnes.png",
      "title": "Universitas Negeri Semarang"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Lambang_Universitas_Negeri_Medan.png/1200px-Lambang_Universitas_Negeri_Medan.png",
      "title": "Universitas Negeri Medan"
    },
    {
      "imageUrl":
          "https://d22gwcrfo2de51.cloudfront.net/wp-content/uploads/2020/08/logo_Universitas-Negeri-Surabaya.png",
      "title": "Universitas Negeri Surabaya"
    },
    {
      "imageUrl": "https://um.ac.id/wp-content/uploads/2019/03/Lambang-UM.png",
      "title": "Universitas Negeri Malang"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/id/thumb/5/51/Logo_Universitas_Negeri_Makassar.png/200px-Logo_Universitas_Negeri_Makassar.png",
      "title": "Universitas Negeri Makassar"
    },
    {
      "imageUrl":
          "https://unram.ac.id/wp-content/uploads/2018/09/UNRAM-LOGO-FIX-STATUTA-.png",
      "title": "Universitas Mataram"
    }
  ];
  
  final List<String> jenisBiaya = [
    "SPP",
    "Uang Pangkal",
    "Uang Asrama",
    "Infaq"
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

  void handlePerguruan(BuildContext context, int nominal) {
    final balanceController = Get.find<BalanceController>();
    final historyController = Get.find<HistoryController>();

    if (selectedJenisBiaya.value.isEmpty) {
      _showErrorSnackbar('Pilih jenis biaya terlebih dahulu.');
      return;
    }

    if (balanceController.balance.value < nominal) {
      _showErrorSnackbar('Saldo tidak cukup untuk transaksi.');
      return;
    }

    balanceController.addBalance(-nominal);

    historyController.addTransaction(
      type: 'Tagihan Perguruan Tinggi',
      amount: nominal,
      detail: 'Bayar ${selectedJenisBiaya.value}',
    );

    amountController.clear();

    _showSuccessSnackbar('Tagihan Perguruan Tinggi', nominal);

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

  void _showSuccessSnackbar(String title, int nominal) {
    Get.snackbar(
      title,
      'Transaksi sebesar Rp $nominal berhasil.',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    );
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}
