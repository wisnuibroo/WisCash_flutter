import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wiscash_/controller/navbar_controller.dart';
import 'package:wiscash_/page/menu/finance_menu.dart';
import 'package:wiscash_/page/menu/home_menu.dart';
import 'package:wiscash_/page/menu/inbox_menu.dart';
import 'package:wiscash_/page/menu/profile_menu.dart';

class NavbarPage extends StatelessWidget {
  NavbarPage({Key? key}) : super(key: key);

  final NavbarController navbarController = Get.put(NavbarController());

  final List<Widget> menus = [
    HomeMenu(),
    FinanceMenu(),
    InboxMenu(),
    ProfileMenu(),
  ];

  final List<IconData> pageIcons = [
    Icons.home,
    Icons.shopping_cart,
    Icons.notifications,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: IndexedStack(
            key: ValueKey<int>(navbarController.selectedIndex.value),
            index: navbarController.selectedIndex.value,
            children: menus,
          ),
        );
      }),
      bottomNavigationBar: Obx(() {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            _buildBottomNavBar(context),
            _buildFloatingButton(context),
          ],
        );
      }),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: navbarController.selectedIndex.value,
        onTap: (index) {
          navbarController.selectedIndex.value = index;
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: pageIcons
            .map((icon) => BottomNavigationBarItem(
                  icon: Icon(icon, size: 28),
                  label: '',
                ))
            .toList(),
      ),
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return Obx(() {
      double buttonPosition = _calculateButtonPosition(context);

      return AnimatedPositioned(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        bottom: 20,
        left: buttonPosition,
        child: GestureDetector(
          onTap: () {
            navbarController.selectedIndex.value =
                navbarController.selectedIndex.value;
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Icon(
                pageIcons[navbarController.selectedIndex.value],
                key: ValueKey<int>(navbarController.selectedIndex.value),
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ),
      );
    });
  }

  double _calculateButtonPosition(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int itemCount = pageIcons.length;
    int selectedIndex = navbarController.selectedIndex.value;

    double itemWidth = screenWidth / itemCount;
    return (itemWidth * selectedIndex) + (itemWidth / 2) - 35;
  }
}
