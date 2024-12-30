import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/component_page/grid_item_adapter.dart';
import 'package:wiscash_/page/home/airpdam_page.dart';
import 'package:wiscash_/page/home/bpjs_page.dart';
import 'package:wiscash_/page/home/donasi_page.dart';
import 'package:wiscash_/page/home/internet_page.dart';
import 'package:wiscash_/page/home/nabung_page.dart';
import 'package:wiscash_/page/home/pendidikan_page.dart';
import 'package:wiscash_/page/home/pln_page.dart';
import 'package:wiscash_/page/home/pulsa_page.dart';
import 'package:wiscash_/page/home/rekomendasi_lainnya_page.dart';
import 'package:wiscash_/page/home/telkom_page.dart';
import 'package:wiscash_/page/home/voucher_google_page.dart';
import 'package:wiscash_/page/home/wisboom_page.dart';
import 'package:wiscash_/page/widget/my_balance_card.dart';
import 'package:wiscash_/page/widget/my_category_button.dart';
import 'package:wiscash_/component_page/promo_card_home_adapter.dart';
import 'package:wiscash_/page/widget/my_text.dart';
import 'package:wiscash_/page/widget/my_kerjasama_card.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  String activeCategory = 'Populer';

  final List<Map<String, dynamic>> favoriteItems = [
    {
      'icon': Icons.savings,
      'title': 'Nabung by WisGoals',
      'route': () => NabungPage(),
    },
    {
      'icon': Icons.history_edu,
      'title': 'Donasi',
      'route': () => DonasiPage(),
    },
    {
      'icon': Icons.electric_bolt_sharp,
      'title': 'PLN',
      'route': () => PlnPage(),
    },
    {
      'icon': Icons.rocket_launch_sharp,
      'title': 'Pulsa/Paket Data',
      'route': () => PulsaPage(),
    },
    {
      'icon': Icons.water_drop,
      'title': 'Air PDAM',
      'route': () => AirpdamPage(),
    },
    {
      'icon': Icons.live_tv,
      'title': 'Internet & TV Kabel',
      'route': () => InternetPage(),
    },
  ];

  final List<Map<String, dynamic>> otherItems = [
    {
      'icon': Icons.phone,
      'title': 'Telkom',
      'route': () => TelkomPage(),
    },
    {
      'icon': Icons.school,
      'title': 'Pendidikan',
      'route': () => PendidikanPage(),
    },
    {
      'icon': Icons.all_inclusive_sharp,
      'title': 'WisBoom',
      'route': () => WisboomPage()
    },
    {
      'icon': Icons.add_card,
      'title': 'BPJS',
      'route': () => BpjsPage(),
    },
    {
      'icon': Icons.play_arrow_rounded,
      'title': 'Voucher Google Play',
      'route': () => VoucherGooglePage()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF025A5F),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppBar(
                backgroundColor: const Color(0xFF025A5F),
                elevation: 0,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/image/wiscash2.png',
                    width: 120,
                    height: 50,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 29),
                      child: MyBalanceCard(),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                MyCategoryButton(
                                  label: 'Populer',
                                  isActive: activeCategory == 'Populer',
                                  onTap: () {
                                    setState(() {
                                      activeCategory = 'Populer';
                                    });
                                  },
                                ),
                                const SizedBox(width: 8),
                                MyCategoryButton(
                                  label: 'Pilihan Lain',
                                  isActive: activeCategory == 'Pilihan Lain',
                                  onTap: () {
                                    setState(() {
                                      activeCategory = 'Pilihan Lain';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 19),
                          GridItemAdapter(
                            items: activeCategory == 'Populer'
                                ? favoriteItems
                                : otherItems,
                          ),
                          SizedBox(height: 50),
                          const MyText(
                            text: "Rekomendasi Lainnya",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 18),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => RekomendasiLainnyaPage(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(milliseconds: 350),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/image/Beli Tiket Liburan  .png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => RekomendasiLainnyaPage(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(milliseconds: 350),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/image/Beli pulsa.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 37),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyText(
                                      text: "Kerjasama WisCash",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                MyText(
                                  text: "WisCash bekerjasama dengan mereka",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          MyKerjasamaCard(),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  text: "⚡ PROMO TERMURAH, DIJAMIN ⚡",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          PromoCardHomeAdapter(),
                          SizedBox(height: 50)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
