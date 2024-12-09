import 'package:flutter/material.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class InboxMenu extends StatelessWidget {
  const InboxMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: MyText(
            text: "Notification",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFF025A5F),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: const Color(0xFFF8F9FA),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Icon(
                Icons.notifications_off_outlined,
                size: 90,
                color: Colors.grey,
              ),
              MyText(
                text: "Tidak ada notifikasi untuk Anda saat ini.",
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ],
          ),
        ));
  }
}
