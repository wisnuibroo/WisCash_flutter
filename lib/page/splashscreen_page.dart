import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiscash_/page/widget/my_item_splash_screen.dart';
import 'package:wiscash_/page/navbar_page.dart';
import 'package:wiscash_/page/widget/my_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;

  final List<Map<String, String>> splashData = [
    {
      "text": "Welcome to WisCash, Let’s cash!",
      "image":
          "https://img.freepik.com/premium-vector/hand-from-screen-mobile-phone-giving-coin-piggy-bank_778687-510.jpg?w=996"
    },
    {
      "text":
          "We help people connect with cash \naround the Asean of Indonesian",
      "image":
          "https://img.freepik.com/free-vector/social-support-concept-residents-getting-basic-benefits-from-government_74855-11060.jpg?t=st=1733186561~exp=1733190161~hmac=5eadd26fabcd9385121f59f0ab060128a01c254baf9a2b05210e58488f295d25&w=1060"
    },
    {
      "text": "We show the easy way to cash. \nJust stay at home with us",
      "image":
          "https://img.freepik.com/free-vector/tiny-people-saving-money-piggy-bank-isolated-flat-illustration_74855-11124.jpg?t=st=1733186637~exp=1733190237~hmac=d59e454331529f66505c7aaa04dbca2165832dd37778cb933c3bb5108134d659&w=996"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => MyItemSplashScreen(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    MyButton(
                      onPressed: () {
                        Get.to(
                          () => NavbarPage(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 600),
                        );
                      },
                      textButton: 'Continue',
                      backgroundColor: const Color(0xFF025A5F),
                      textColor: Colors.white,
                      radius: 15,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color(0xFF025A5F)
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
