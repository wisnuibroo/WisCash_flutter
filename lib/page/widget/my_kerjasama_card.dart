import 'package:flutter/material.dart';
import 'package:wiscash_/model/model_kerjasama.dart';

class MyKerjasamaCard extends StatelessWidget {
  final List<ModelKerjasama> tipsItem = [
    ModelKerjasama(
      image: 'assets/image/traveloka-logo.png',
      title: 'Traveloka',
    ),
    ModelKerjasama(
      image: 'assets/image/trip-logo.png',
      title: 'Trip',
    ),
    ModelKerjasama(
      image: 'assets/image/booking-logo.png',
      title: 'Booking',
    ),
    ModelKerjasama(
      image: 'assets/image/telkomsel.jpg',
      title: 'Telkomsel',
    ),
    ModelKerjasama(
      image: 'assets/image/indihome.png',
      title: 'Indihome',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tipsItem.length,
            itemBuilder: (context, index) {
              final item = tipsItem[index];
              return Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Container(
                  width: 100, 
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: Image.asset(
                      item.image,
                      width: double.infinity,
                      height: 120, 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
