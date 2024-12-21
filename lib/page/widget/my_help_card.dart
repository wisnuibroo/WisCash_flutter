import 'package:flutter/material.dart';
import 'package:wiscash_/page/widget/my_button.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class MyHelpCard {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Selangkah lebih dekat menuju impianmu!',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 10),
              _helpItem(
                context,
                icon: Icons.admin_panel_settings,
                title: 'Bebas biaya admin',
                description: 'Pakai sesukamu, semua bebas biaya admin.',
              ),
              _helpItem(
                context,
                icon: Icons.attach_money,
                title: 'Tanpa jumlah minimum',
                description: 'Mulai dengan berapapun jumlah yang kamu mau.',
              ),
              _helpItem(
                context,
                icon: Icons.grade_outlined,
                title: 'Capai Impianmu',
                description: 'Capai impianmu bersama WisGoals!',
              ),
              SizedBox(height: 20),
              Center(
                child: MyButton(
                  onPressed: () => Navigator.pop(context),
                  textButton: 'MENGERTI',
                  textColor: Colors.white,
                  backgroundColor: Color(0xFF025A5F),
                  radius: 10,
                  width: double.infinity,
                  height: 50,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _helpItem(BuildContext context,
      {required IconData icon,
      required String title,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF025A5F), size: 28),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                SizedBox(height: 5),
                MyText(
                  text: description,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
