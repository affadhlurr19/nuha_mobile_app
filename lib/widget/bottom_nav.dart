import 'package:flutter/material.dart';
import 'package:nuha_mobile_app/common/styles.dart';
import 'package:nuha_mobile_app/ui/article_list_page.dart';
import 'package:nuha_mobile_app/ui/favorite_list_page.dart';
import 'package:nuha_mobile_app/ui/home_page.dart';
import 'package:nuha_mobile_app/ui/profile_page.dart';

class BottomNav extends StatefulWidget {
  static const routeName = '/bottom-nav';

  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _bottomNavIndex = 0;
  static const String _headlineText = 'Home';

  final List<Widget> _listWidget = [
    const HomePage(),
    const ArticlePage(),
    const ProfilePage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.public),
      label: _headlineText,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.menu_book),
      label: ArticlePage.articleTitle,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: ProfilePage.profileTitle,
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          backgroundColor: primaryColor,
          selectedItemColor: secondaryColor,
          currentIndex: _bottomNavIndex,
          items: _bottomNavBarItems,
          onTap: _onBottomNavTapped,
        ),
      ),
      extendBody: true,
    );
  }
}
