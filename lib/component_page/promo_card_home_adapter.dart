import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/model/model_promo.dart';
import 'package:wiscash_/page/home/pizzahut_page.dart';
import 'package:wiscash_/page/widget/my_text.dart';

class PromoCardHomeAdapter extends StatelessWidget {
  final List<ModelPromo> promoItems = [
    ModelPromo(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEk3vWHRjZfLXJgUPNY1cUXQ7kjHXV3_3JWxA21g2jBNF0TaELj1590nTtgUi9VjpgyOU&usqp=CAU',
      diskon: '27%',
      waktuBuka: 'SETIAP HARI',
      title: 'Pizza Hut 3 Varian Rasa',
      harga: 'Rp234.257',
    ),
    ModelPromo(
      image:
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/a1/33/dc/caption.jpg?w=1200&h=-1&s=1',
      diskon: '43%',
      waktuBuka: 'RABU, KAMIS, SABTU',
      title: 'Kobe Beef Steak Sakura',
      harga: 'Rp855.000',
    ),
    ModelPromo(
      image:
          'https://awsimages.detik.net.id/community/media/visual/2021/03/31/pork-burger-4.jpeg?w=7244',
      diskon: '31%',
      waktuBuka: 'SETIAP HARI',
      title: 'Burger Beef And Cheese Jumbo',
      harga: 'Rp70.000',
    ),
    ModelPromo(
      image:
          'https://cdn.idntimes.com/content-images/community/2022/04/fromandroid-09bf54918d79163f511080b7150d68fb_600x400.jpg',
      diskon: '21%',
      waktuBuka: 'MINGGU',
      title: 'Kepiting Saus Madu Sedang ',
      harga: 'Rp15.800',
    ),
    ModelPromo(
      image:
          'https://img.okezone.com/content/2020/11/27/298/2317559/rasa-kurang-lezat-ketahui-7-kesalahan-memasak-lobster-Q4Ho0wUVLD.jpg',
      diskon: '49%',
      waktuBuka: 'SABTU, MINGGU',
      title: 'Lobster Saus Keju Jumbo',
      harga: 'Rp306.800',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: MyText(
            text: "Diskon s.d. 49% seharian. Cepetan, WisCash!",
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: promoItems.length,
            itemBuilder: (context, index) {
              final item = promoItems[index];
              return Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    if (item.title.contains('Pizza Hut')) {
                      Get.to(
                        () => PizzahutPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    }
                  },
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image.network(
                                item.image,
                                width: double.infinity,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  item.diskon,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.waktuBuka,
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.harga,
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
