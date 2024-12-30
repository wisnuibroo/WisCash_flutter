import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/sekolah_controller.dart';
import 'package:wiscash_/page/home/sekolah_detail_page.dart';
import 'package:wiscash_/page/widget/my_item_list.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class SekolahPage extends StatefulWidget {
  const SekolahPage({super.key});

  @override
  _SekolahPageState createState() => _SekolahPageState();
}

class _SekolahPageState extends State<SekolahPage> {
  final TextEditingController searchController = TextEditingController();
  final SekolahController sekolahController = Get.put(SekolahController());

  List<Map<String, String>> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = List.from(sekolahController.sekolahList);

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
      filteredList = sekolahController.sekolahList.where((item) {
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
          text: "Sekolah",
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
                  hintText: "Cari sekolah...",
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
                        () => SekolahDetailPage(),
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
