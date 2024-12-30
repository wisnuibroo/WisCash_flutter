import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';

class SekolahController extends GetxController {
  final TextEditingController amountController = TextEditingController();
  final selectedJenisBiaya = ''.obs;

final List<Map<String, String>> sekolahList = [
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/id/c/c6/Logo_MAN_Insan_Cendekia.png",
      "title": "MAN Insan Cendekia Serpong"
    },
    {
      "imageUrl": "https://www.luisa.id/images/logobig.png",
      "title": "SMA Katolik St. Louis 1 Surabaya"
    },
    {
      "imageUrl":
          "https://smartschool.sma.praditadirgantara.sch.id/uploads/images/site.png",
      "title": "SMA Pradita Dirgantara Boyolali"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/id/c/c6/Logo_MAN_Insan_Cendekia.png",
      "title": "MAN Insan Cendekia Pekalongan"
    },
    {
      "imageUrl":
          "https://www.dbl.id/uploads/school/1099/321-SMAN_8_JAKARTA.png",
      "title": "SMAN 8 Jakarta"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-TSq0xe0sTD36Abp516gxbHlUy544xh9diw&s",
      "title": "SMA Labschool Kebayoran"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/en/thumb/7/7c/Emblem_of_Canisius_College.svg/800px-Emblem_of_Canisius_College.svg.png",
      "title": "SMAS Kanisius Jakarta"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxqQiVCl5g07ElRnMGYhN5ABTk7uo0mmnHSQ&s",
      "title": "SMAN 2 Jakarta"
    },
    {
      "imageUrl":
          "https://www.dbl.id/uploads/school/7053/347-SMA_BPK_1_PENABUR_BANDUNG.png",
      "title": "SMAS BPK 1 Penabur Bandung"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgZNiuDwfPF7Q6Vjyns481caZ19hCSqeaq0w&s",
      "title": "SMAN 68 Jakarta"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/commons/1/13/Logo_SMA_Negeri_1_Semarang.png",
      "title": "SMAN 1 Semarang"
    },
    {
      "imageUrl":
          "https://pbs.twimg.com/profile_images/2579748388/um4mnu3m369hwuf0pi9n_400x400.png",
      "title": "SMA Negeri 1 Bandung"
    },
    {
      "imageUrl":
          "https://sman7bandung.sch.id/media_library/posts/welcome-image-1592707572853.png",
      "title": "SMAN 7 Bandung"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8TsqVPcq0voE7MZQh9VzuOf4Y5F4pveIluQ&s",
      "title": "SMA Negeri 5 Surabaya"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/id/0/0f/Logo_BPK_PENABUR.png",
      "title": "SMA BPK Penabur Jakarta"
    },
    {
      "imageUrl":
          "https://smakristen1metro.sch.id/wp-content/uploads/2022/03/logo-IKA-SMAK-300x300.png",
      "title": "SMA Kristen 1 Jakarta"
    },
    {
      "imageUrl":
          "https://www.dbl.id/uploads/school/1117/705-SMAN_6_JAKARTA.png",
      "title": "SMA Negeri 6 Jakarta"
    },
    {
      "imageUrl":
          "https://www.dbl.id/uploads/school/66951/177-SMA_CITA_BUANA_JAKARTA.png",
      "title": "SMA Sekolah Cita Buana"
    },
    {
      "imageUrl":
          "https://seeklogo.com/images/S/sma-taruna-nusantara-logo-0A050BD857-seeklogo.com.png",
      "title": "SMA Taruna Nusantara Magelang"
    },
    {
      "imageUrl":
          "https://assets.kompasiana.com/statics/files/1417571717933569420.gif?t=o&v=700?t=t&v=80",
      "title": "SMA Negeri 4 Bandung"
    },
    {
      "imageUrl":
          "https://seeklogo.com/images/S/sma-negeri-30-jakarta-logo-95EC5E4E83-seeklogo.com.png",
      "title": "SMA Nasional Jakarta"
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjsXbsatplwrgekJRPSkt7LV29GCYGXE4BUg&s",
      "title": "SMA Negeri 1 Surakarta"
    },
    {
      "imageUrl":
          "https://sman4sby.sch.id/wp-content/uploads/2024/04/cropped-cropped-6-SMAN_4_SURABAYA.png",
      "title": "SMA Negeri 4 Surabaya"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/id/b/ba/Logo-SMAN7YK.png",
      "title": "SMA Negeri 7 Yogyakarta"
    },
    {
      "imageUrl":
          "https://www.dbl.id/uploads/school/13685/789-SMAN_1_MALANG.png",
      "title": "SMA Negeri 1 Malang"
    },
    {
      "imageUrl":
          "https://www.dbl.id/uploads/school/13140/492-SMA_PETRA_2_SURABAYA.png",
      "title": "SMA Kristen Petra Surabaya"
    },
    {
      "imageUrl":
          "https://www.dbl.id/uploads/school/1117/705-SMAN_6_JAKARTA.png",
      "title": "SMAN 6 Jakarta"
    },
    {
      "imageUrl":
          "https://upload.wikimedia.org/wikipedia/id/3/35/Logo_SMAN_1_Denpasar.png",
      "title": "SMA Negeri 1 Denpasar"
    },
    {
      "imageUrl":
          "https://sekolahadipangastuti.id/wp-content/uploads/elementor/thumbs/SMA-MUHAMMADIYAH-1-SURAKARTA-qsclvbs06db2ntyh7jtio39ocfwrnn7j1rpoh0tmpw.png",
      "title": "SMA Muhammadiyah 1 Surakarta"
    },
    {
      "imageUrl":
          "https://seeklogo.com/images/S/sma-2-yogyakarta-logo-3D44B46EBA-seeklogo.com.png",
      "title": "SMA Negeri 2 Yogyakarta"
    },
    {
      "imageUrl":
          "https://www.dbl.id/uploads/school/7871/717-SMAN_1_CIREBON.png",
      "title": "SMAN 1 Cirebon"
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

  void handleSekolah(BuildContext context, int nominal) {
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
      type: 'Tagihan Sekolah',
      amount: nominal,
      detail: 'Bayar ${selectedJenisBiaya.value}',
    );

    amountController.clear();

    _showSuccessSnackbar('Tagihan Sekolah', nominal);

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
