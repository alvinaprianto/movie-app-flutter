import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:movie_app/core/pages/favorite_page.dart';
import 'package:movie_app/core/pages/home_page.dart';
import 'package:movie_app/core/pages/profile_page.dart';
import 'package:movie_app/core/pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOption = const [
    HomePage(),
    SearchPage(),
    FavoritePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(
                Svg('images/nav_home.svg'),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                Svg('images/nav_search.svg'),
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                Svg('images/nav_save.svg'),
              ),
              label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
