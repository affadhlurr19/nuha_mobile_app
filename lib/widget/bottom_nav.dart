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
    const ArticleListPage(),
    const ProfilePage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.public),
      label: _headlineText,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.menu_book),
      label: ArticleListPage.articleTitle,
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
      bottomNavigationBar: SizedBox(
        height: 75,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: titleColor,
            selectedItemColor: iconColor,
            unselectedItemColor: const Color(0XFFFFFFFF),
            currentIndex: _bottomNavIndex,
            items: _bottomNavBarItems,
            onTap: _onBottomNavTapped,
            
          ),
        ),
      ),
      extendBody: true,
    );
  }
}
