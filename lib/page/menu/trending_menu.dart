import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/model/model_trending.dart';
import 'package:wiscash_/page/home/burger_page.dart';
import 'package:wiscash_/page/home/kepiting_page.dart';
import 'package:wiscash_/page/home/kobesteak_page.dart';
import 'package:wiscash_/page/home/lobster_page.dart';
import 'package:wiscash_/page/home/pizzahut_page.dart';
import 'package:wiscash_/page/widget/my_text.dart';
import 'package:wiscash_/page/widget/my_trending_card.dart';

class TrendingMenu extends StatefulWidget {
  const TrendingMenu({super.key});

  @override
  _TrendingMenuState createState() => _TrendingMenuState();
}

class _TrendingMenuState extends State<TrendingMenu> {
  final List<ModelTrending> products = [
    ModelTrending(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEk3vWHRjZfLXJgUPNY1cUXQ7kjHXV3_3JWxA21g2jBNF0TaELj1590nTtgUi9VjpgyOU&usqp=CAU',
      title: "Pizza Hut 3 Varian Rasa",
      harga: 'Rp234.257',
    ),
    ModelTrending(
      image:
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/a1/33/dc/caption.jpg?w=1200&h=-1&s=1',
      title: 'Kobe Beef Steak Sakura',
      harga: 'Rp855.000',
    ),
    ModelTrending(
      image:
          'https://awsimages.detik.net.id/community/media/visual/2021/03/31/pork-burger-4.jpeg?w=7244',
      title: 'Burger Beef And Cheese Jumbo',
      harga: 'Rp70.000',
    ),
    ModelTrending(
      image:
          'https://cdn.idntimes.com/content-images/community/2022/04/fromandroid-09bf54918d79163f511080b7150d68fb_600x400.jpg',
      title: "Kepiting Saus Madu Sedang",
      harga: 'Rp340.000',
    ),
    ModelTrending(
      image:
          'https://img.okezone.com/content/2020/11/27/298/2317559/rasa-kurang-lezat-ketahui-7-kesalahan-memasak-lobster-Q4Ho0wUVLD.jpg',
      title: 'Lobster Saus Keju Jumbo',
      harga: 'Rp306.800',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF025A5F),
        elevation: 0,
        title: const MyText(
          text: 'Trending',
          color: Colors.white,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white70),
            onPressed: () {},
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          MyText(
              text: "12.12",
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFAD150A)),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return InkWell(
                  onTap: () {
                    if (product.title.contains('Pizza Hut')) {
                      Get.to(
                        () => PizzahutPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    } else if (product.title.contains('Steak')) {
                      Get.to(
                        () => KobeSteakPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    } else if (product.title.contains('Burger')) {
                      Get.to(
                        () => BurgerPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    } else if (product.title.contains('Kepiting')) {
                      Get.to(
                        () => KepitingPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    } else if (product.title.contains('Lobster')) {
                      Get.to(
                        () => LobsterPage(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 350),
                      );
                    }
                  },
                  child: MyTrendingCard(
                    image: product.image,
                    title: product.title,
                    harga: product.harga,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
