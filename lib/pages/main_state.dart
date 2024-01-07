import "package:flutter/material.dart";
import 'package:trendyol_store/pages/search_page.dart';
import '../widgets/app_bar.dart';
import 'favorites_page.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class MainState extends StatefulWidget {
  const MainState({super.key});

  @override
  State<MainState> createState() => _MainStateState();
}

class _MainStateState extends State<MainState> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const PreferredSize(
          preferredSize: Size(100, 45), child: AppBarWidget()),
      body: IndexedStack(
        index: _currentIndex,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const HomePage(),
          const SearchPage(),
          // ignore: prefer_const_constructors
          FavoritesPage(),
        const Text(""),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        backgroundColor: Colors.grey.shade200,
        currentIndex: _currentIndex,
        iconSize: 35,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
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
