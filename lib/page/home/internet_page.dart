import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/page/home/internet_detail_page.dart';
import 'package:wiscash_/page/widget/my_item_list.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class InternetPage extends StatefulWidget {
  const InternetPage({super.key});

  @override
  _InternetPageState createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> {
  final TextEditingController searchController = TextEditingController();

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

  List<Map<String, String>> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = List.from(internetList);

    searchController.addListener(_filterInternetList);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterInternetList);
    searchController.dispose();
    super.dispose();
  }

  void _filterInternetList() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredList = internetList.where((item) {
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
          text: "Internet & TV Kabel",
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
                  hintText: "Cari......",
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
                        () => InternetDetailPage(),
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
