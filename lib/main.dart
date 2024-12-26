import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/balance_controller.dart';
import 'package:wiscash_/controller/home/buat_impian_controller.dart';
import 'package:wiscash_/controller/home/history_controller.dart';
import 'package:wiscash_/controller/home/tagihan_listrik_controller.dart';
import 'package:wiscash_/controller/home/token_listrik_controller.dart';
import 'package:wiscash_/page/navbar_page.dart';
import 'package:wiscash_/page/splashscreen_page.dart';

void main() {
  Get.put(HistoryController());
  Get.put(BalanceController());
  Get.put(BuatImpianController());
  Get.put(TokenListrikController());
  Get.put(TagihanListrikController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/dashboard', page: () => NavbarPage()),
        GetPage(name: '/splash', page: () => SplashScreen()),
      ],
      home: SplashScreen(),
    );
  }
}
