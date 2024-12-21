import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:wiscash_/controller/navbar_controller.dart';
import 'package:wiscash_/page/menu/trending_menu.dart';
import 'package:wiscash_/page/menu/home_menu.dart';
import 'package:wiscash_/page/menu/inbox_menu.dart';
import 'package:wiscash_/page/menu/profile_menu.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({Key? key}) : super(key: key);

  @override
  _NavbarPageState createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage>
    with SingleTickerProviderStateMixin {
  final NavbarController navbarController = Get.put(NavbarController());

  late final AnimationController _animationController;
  late Animation<double> _buttonPositionAnimation;

  final List<Widget> _menus = [
    HomeMenu(),
    TrendingMenu(),
    InboxMenu(),
    ProfileMenu(),
  ];

  final List<IconData> _pageIcons = [
    Icons.home,
    Icons.trending_up_sharp,
    Icons.notifications,
    Icons.person,
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _initializeButtonPosition(navbarController.selectedIndex.value);
  }

  void _initializeButtonPosition(int index) {
    final double screenWidth =
        WidgetsBinding.instance.window.physicalSize.width /
            WidgetsBinding.instance.window.devicePixelRatio;
    final double itemWidth = screenWidth / _pageIcons.length;
    final double initialPosition = (itemWidth * index) + (itemWidth / 2) - 35;

    _buttonPositionAnimation = Tween<double>(
      begin: initialPosition,
      end: initialPosition,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _animateButtonPosition(int newIndex) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double itemWidth = screenWidth / _pageIcons.length;
    final double newPosition = (itemWidth * newIndex) + (itemWidth / 2) - 35;

    setState(() {
      _buttonPositionAnimation = Tween<double>(
        begin: _buttonPositionAnimation.value,
        end: newPosition,
      ).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ));
    });

    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: _menus[navbarController.selectedIndex.value],
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          _BottomNavBar(
            pageIcons: _pageIcons,
            onTap: (index) {
              _animateButtonPosition(index);
              navbarController.selectedIndex.value = index;
            },
            selectedIndex: navbarController.selectedIndex,
          ),
          _FloatingNavButton(
            animation: _buttonPositionAnimation,
            icon: _pageIcons[navbarController.selectedIndex.value],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _FloatingNavButton extends StatelessWidget {
  final Animation<double> animation;
  final IconData icon;

  const _FloatingNavButton({
    Key? key,
    required this.animation,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Positioned(
          bottom: 20,
          left: animation.value,
          child: Material(
            elevation: 5,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color(0xFF025A5F),
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final List<IconData> pageIcons;
  final Function(int) onTap;
  final RxInt selectedIndex;

  const _BottomNavBar({
    Key? key,
    required this.pageIcons,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: selectedIndex.value,
          onTap: onTap,
          selectedItemColor: Color(0xFF025A5F),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: pageIcons
              .map((icon) => BottomNavigationBarItem(
                    icon: Icon(icon, size: 28),
                    label: '',
                  ))
              .toList(),
        ),
      ),
    );
  }
}
