import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/controller/home/perguruan_controller.dart';
import 'package:wiscash_/page/home/perguruan_detail_page.dart';
import 'package:wiscash_/page/widget/my_item_list.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class PerguruanTinggiPage extends StatefulWidget {
  const PerguruanTinggiPage({super.key});

  @override
  _PerguruanPageState createState() => _PerguruanPageState();
}

class _PerguruanPageState extends State<PerguruanTinggiPage> {
  final TextEditingController searchController = TextEditingController();
  final PerguruanController perguruanController = Get.put(PerguruanController());

  List<Map<String, String>> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = List.from(perguruanController.perguruanList);

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
      filteredList = perguruanController.perguruanList.where((item) {
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
          text: "Perguruan Tinggi",
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
                  hintText: "Cari perguruan tinggi...",
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
                        () => PerguruanDetailPage(),
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
