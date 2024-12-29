import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/page/home/donasi_detail_page.dart';
import 'package:wiscash_/page/widget/my_item_list.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class DonasiPage extends StatefulWidget {
  const DonasiPage({super.key});

  @override
  _DonasiPageState createState() => _DonasiPageState();
}

class _DonasiPageState extends State<DonasiPage> {
  final TextEditingController searchController = TextEditingController();

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

  List<Map<String, String>> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = List.from(donasiList);

    searchController.addListener(_filterDonasiList);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterDonasiList);
    searchController.dispose();
    super.dispose();
  }

  void _filterDonasiList() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredList = donasiList.where((item) {
        final title = item['title']!.toLowerCase();
        return title.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          text: "Donasi",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF8F9FA),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Color(0xFFF8F9FA),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Cari donasi...",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final item = filteredList[index];
                  return MyItemList(
                    imageUrl: item['imageUrl']!,
                    title: item['title']!,
                    onPressed: () {
                      Get.to(
                        () => DonasiDetailPage(),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 400),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
