import "package:flutter/material.dart";
import 'package:trendyol_store/pages/home_page.dart';
import '../widgets/app_bar.dart';
import 'favorites_page.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class MainState extends StatefulWidget {
  MainState({super.key});

  @override
  State<MainState> createState() => _MainStateState();
}

class _MainStateState extends State<MainState> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const PreferredSize(
          preferredSize: Size(100, 45), child: AppBarWidget()),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomePage(),
          const Text(""),
          const FavoritesPage(),
          const Text(""),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange.shade600,
        backgroundColor: Colors.grey.shade100,
        currentIndex: _currentIndex,
        iconSize: 35,
        onTap: (int newIndex) {
          _currentIndex = newIndex;

          _pageController.animateToPage(newIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: ""),
        ],
      ),
    );
  }
}
